# coding: utf-8

import serial
import Queue
import threading
import struct
import time
import rospy
from math import radians

header0 = 0xFE
header1 = 0xCE


class Driver:

    def __init__(self, port):
        self.port = port
        self.ser = None

        self.recv_queue = Queue.Queue()
        self.snd_queue = Queue.Queue()

        self.imu_callback = None
        self.universal_vel_callback = None
        self.battery_callback = None

    def connect(self):
        while not rospy.is_shutdown():
            try:
                self.ser = serial.Serial(port=self.port, baudrate=115200, timeout=5, write_timeout=5)
                break
            except Exception as e:
                print e

        threading.Thread(target=self.__work_recv).start()
        threading.Thread(target=self.__work_send).start()

    def is_open(self):
        if self.ser is None:
            return False
        return self.ser.isOpen()

    def disconnect(self):
        self.ser.close()
        self.snd_queue.put(None)
        self.recv_queue.put(None)

    def led_open(self):
        self.snd_queue.put([0xAB, 0xBC, 0x01, 0x03, 0x01, 0x02, 0x07])

    def led_close(self):
        self.snd_queue.put([0xAB, 0xBC, 0x01, 0x03, 0x00, 0x01, 0x05])

    def buzzer_open(self):
        self.snd_queue.put([0xAB, 0xBC, 0x02, 0x03, 0x01, 0x01, 0x07])

    def buzzer_close(self):
        self.snd_queue.put([0xAB, 0xBC, 0x02, 0x03, 0x00, 0x01, 0x06])

    def motor_spin(self, index, pwm):
        cmd = self.__motor_cmd(index, pwm)
        # print "cmd: {}".format(cmd)
        self.snd_queue.put(cmd)

    def servo_rotate(self, angle):
        cmd = self.__servo_cmd(angle)
        self.snd_queue.put(cmd)

    def universal_ctrl(self, linear, angular):
        cmd = self.__universal_cmd(linear, angular)
        self.snd_queue.put(cmd)

    def __universal_cmd(self, linear, angular):
        cmd = [0xAB, 0xBC, 0x22]
        # 数据长度
        cmd.append(5)
        # 线速度
        linear_pack = bytearray(struct.pack('h', int(linear * 1000.0)))
        cmd.append(linear_pack[0])
        cmd.append(linear_pack[1])
        # 角速度
        angular_pack = bytearray(struct.pack('h', int(angular * 1000.0)))
        cmd.append(angular_pack[0])
        cmd.append(angular_pack[1])
        cmd.append(self.__check_sum(cmd, 9))

        return cmd




        cmd.append(self.__check_sum(cmd, 8))
        return cmd

    def __servo_cmd(self, angle):
        cmd = [0xAB, 0xBC, 0x31]
        # 数据长度
        cmd.append(4)
        # 电机编号
        cmd.append(0x01)
        # 旋转角度
        angle = int(angle * 10)

        angle_pack = bytearray(struct.pack('h', angle))
        cmd.append(angle_pack[0])
        cmd.append(angle_pack[1])
        cmd.append(self.__check_sum(cmd, 8))
        return cmd

    def __check_sum(self, data, len):
        s = 0
        for i in range(2, len - 1):
            s += data[i]
        return s & 0xff

    def __is_check(self, data, len):
        s = 0
        for i in range(2, len - 1):
            s += data[i]
        return (s & 0xff) == data[len - 1]

    def __do_imu(self, data):
        try:
            # acc
            ax = struct.unpack('h', bytearray(data[4:6]))[0]
            ay = struct.unpack('h', bytearray(data[6:8]))[0]
            az = struct.unpack('h', bytearray(data[8:10]))[0]

            # rot
            gx = struct.unpack('h', bytearray(data[10:12]))[0]
            gy = struct.unpack('h', bytearray(data[12:14]))[0]
            gz = struct.unpack('h', bytearray(data[14:16]))[0]

            # mag
            mx = struct.unpack('h', bytearray(data[16:18]))[0]
            my = struct.unpack('h', bytearray(data[18:20]))[0]
            mz = struct.unpack('h', bytearray(data[20:22]))[0]

            if self.imu_callback is not None:
                accel_ratio = 16384.0
                gyro_ratio = 1/65.5/(180/3.1415926)#radians(1 / 16.4)
                self.imu_callback([ax / accel_ratio, ay / accel_ratio, az / accel_ratio, gx * gyro_ratio, gy * gyro_ratio, gz * gyro_ratio, mx, my, mz])
        except Exception as e:
            print "imu err: {}".format(data)

        # print time.time()
        # print "({}, {}, {}) ({}, {}, {}) ({}, {}, {})".format(ax, ay, az, gx, gy, gz, mx, my, mz)

    def __do_log(self, data):
        # print time.time()
        index = len(data) - 1
        try:
            str = bytearray(data[4:index]).decode()
            print str
        except Exception as e:
            print data

    def __do_universal_vel(self, data):
        # linear
        linear = struct.unpack('h', bytearray(data[4:6]))[0]
        # angle
        angle = struct.unpack('h', bytearray(data[6:8]))[0]

        if self.universal_vel_callback is not None:
            self.universal_vel_callback(linear / 1000.0, angle / 1000.0)
        # print "{} {}".format(linear, angle)

    def __do_battery(self, data):
        # voltage
        voltage = struct.unpack('h', bytearray(data[4:6]))[0]
        if self.battery_callback is not None:
            self.battery_callback(voltage / 100.0)

    def __do_parse(self, data):
        d_type = data[2]
        # if d_type != 0x11:
        #     print data
        if d_type == 0x11:
            self.__do_imu(data)
        elif d_type == 0xF1:
            self.__do_log(data)
        elif d_type == 0x12:
            self.__do_universal_vel(data)
        elif d_type == 0x01:
            # Led 状态信息
            print data
        elif d_type == 0x13:
            self.__do_battery(data)
        else:
            print data

    def __do_recv(self):
        rx_buf = []

        while not rospy.is_shutdown():
            try:
                buff = self.recv_queue.get()
                if buff is None:
                    break
                buff = bytearray(buff)[0]
                rx_buf.append(buff)

                while len(rx_buf) > 0:
                    # 判断帧头是否正确 header0
                    if rx_buf[0] != header0:
                        del rx_buf[0]
                        continue

                    # 判断长度是否够 header0 和 header1
                    if len(rx_buf) < 2:
                        break

                    # 判断帧头是否正确 header1
                    if rx_buf[1] != header1:
                        del rx_buf[0]
                        del rx_buf[0]
                        continue

                    # 判断是否包含 type 和 len
                    if len(rx_buf) < 4:
                        break
                    r_type = rx_buf[2]
                    r_len = rx_buf[3]

                    # 判断剩余长度是否够长
                    if len(rx_buf) < r_len + 4:
                        break

                    # 校验checksum
                    if not self.__is_check(rx_buf, r_len + 4):
                        del rx_buf[0]
                        del rx_buf[0]
                        continue

                    data = rx_buf[0: r_len + 4]
                    self.__do_parse(list(data))
                    for i in range(r_len + 4):
                        del rx_buf[0]
            except Exception as e:
                rospy.logerr(e)

    def __work_recv(self):
        threading.Thread(target=self.__do_recv).start()
        while not rospy.is_shutdown():
            try:
                buff = self.ser.read(1)
                self.recv_queue.put(buff)
            except Exception as e:
                rospy.logerr(e)
                self.ser.flushInput()
                self.ser.flushOutput()

    def __work_send(self):
        while self.is_open():
            try:
                arr = self.snd_queue.get()
                if arr is None:
                    break

                self.ser.write(bytearray(arr))
            except Exception as e:
                rospy.logerr(e)
                self.ser.flushInput()
                self.ser.flushOutput()