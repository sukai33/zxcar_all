#! /usr/bin/env python
# coding: utf-8

import rospy
from driver import Driver
from sensor_msgs.msg import Imu, MagneticField, BatteryState
from geometry_msgs.msg import Twist
from std_srvs.srv import SetBool, SetBoolRequest, SetBoolResponse
from std_msgs.msg import Float32


def imu_callback(data):
    imu = Imu()
    imu.linear_acceleration.x = data[0]
    imu.linear_acceleration.y = data[1]
    imu.linear_acceleration.z = data[2]
    imu.angular_velocity.x = data[3]
    imu.angular_velocity.y = data[4]
    imu.angular_velocity.z = data[5]
    imu_publisher.publish(imu)

    magnetic = MagneticField()
    magnetic.magnetic_field.x = data[6]
    magnetic.magnetic_field.y = data[7]
    magnetic.magnetic_field.z = data[8]
    magnetic_publisher.publish(magnetic)


def universal_vel_callback(linearVel, angleVel):

    twist = Twist()
    twist.linear.x = linearVel
    twist.angular.z = angleVel
    vel_publisher.publish(twist)


def led_callback(msg):
    if not isinstance(msg, SetBoolRequest):
        return
    if msg.data:
        driver.led_open()
    else:
        driver.led_close()

    response = SetBoolResponse()
    response.success = True
    return response


def buzzer_callback(msg):
    if not isinstance(msg, SetBoolRequest):
        return
    if msg.data:
        driver.buzzer_open()
    else:
        driver.buzzer_close()

    response = SetBoolResponse()
    response.success = True
    return response


def cmd_vel_callback(msg):
    if not isinstance(msg, Twist):
        return
    print("vel={},angular={}".format(msg.linear.x,msg.angular.z));
    driver.universal_ctrl(msg.linear.x, msg.angular.z)


def battery_callback(voltage):
    state = BatteryState()
    state.voltage = voltage
    battery_publisher.publish(state)


def cmd_servo_callback(msg):
    if not isinstance(msg, Float32):
        return

    driver.servo_rotate(msg.data)


if __name__ == '__main__':
    # 创建node
    node_name = "zxcar_driver_node"
    rospy.init_node(node_name)

    port = rospy.get_param("~port", "/dev/zxcar")

    imu_publisher = rospy.Publisher("/zxcar/imu", Imu, queue_size=100)
    magnetic_publisher = rospy.Publisher("/zxcar/magnetic", MagneticField, queue_size=100)
    vel_publisher = rospy.Publisher("/zxcar/get_vel", Twist, queue_size=50)
    vel_subscriber = rospy.Subscriber("/zxcar/cmd_vel", Twist, cmd_vel_callback)
    battery_publisher = rospy.Publisher("/zxcar/battery", BatteryState, queue_size=100)
    # 临时使用，后续改为阿克曼结构将废弃此接口
    servo_subscriber = rospy.Subscriber("/zxcar/cmd_servo", Float32, cmd_servo_callback)

    led_service = rospy.Service("/zxcar/led", SetBool, led_callback)
    buzzer_service = rospy.Service("/zxcar/buzzer", SetBool, buzzer_callback)

    driver = Driver(port=port)
    driver.imu_callback = imu_callback
    driver.universal_vel_callback = universal_vel_callback
    driver.battery_callback = battery_callback
    driver.connect()

    rospy.spin()
    driver.disconnect()
