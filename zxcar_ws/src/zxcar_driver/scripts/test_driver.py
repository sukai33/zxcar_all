# coding: utf-8

import serial
import struct
import time


def motor_cmd(pwm):
    cmd = []
    # 方波
    if pwm > 7200:
        pwm = 7200
    if pwm < -7200:
        pwm = -7200

    pwm_pack = bytearray(struct.pack('h', pwm))
    cmd.append(pwm_pack[0])
    cmd.append(pwm_pack[1])
    return cmd;

def string_cmd():
    s = "HelloWorld";
    string_pack = bytearray(struct.pack("I%ds" % (len(s),), len(s), s))
    string_pack = bytearray(struct.pack("I%ds"%len(s),1, s))
    # string_pack = bytearray(struct.pack('sss',s));
    print(repr(string_pack))
    print len(string_pack);
    return string_pack;


if __name__ == '__main__':
    # 构建串口对象
    ser = serial.Serial(port="/dev/zxcar", baudrate=115200, timeout=5, write_timeout=5)
    # 0x01 开灯  0x02 关灯  0x03 切换状态
    ser.write(bytearray([0x03]))

    # 0x04 控制蜂鸣器
    #ser.write(bytearray([0x05]))

    # 控制点击
    # cmd = motor_cmd(3000);
    # ser.write(bytearray(cmd));

    # 显示字符串
    # cmd = string_cmd();
    # ser.write(cmd)

    time.sleep(0.5);


