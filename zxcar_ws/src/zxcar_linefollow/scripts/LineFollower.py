#!/usr/bin/env python
# -*- coding: utf-8 -*-

import cv2 as cv
import rospy
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan,CompressedImage
from cv_bridge import CvBridge;

class LineDetect:
    FRONT = 0;
    TURN_LEFT = 1;
    TURN_RIGHT = 2;
    STOP = 3;
    def __init__(self):
        self.tolerance = 10

    def detect_line(self,img):
        height,width = img.shape[0:2];
        # 高斯滤波
        gaussian = cv.GaussianBlur(img,(3,3),0.1,0.1);

        # 忽略掉远方的图像
        gaussian = gaussian[int(0.7*height):height,int(width*0.2):int(width*0.8)];
        height,width = gaussian.shape[0:2];
        # 将彩色图像转成 HSV
        hsv_img = cv.cvtColor(gaussian,cv.COLOR_BGR2HSV);

        # 颜色过滤
        lower_color = (0,0,200);
        upper_color = (180,20,255);

        # 判断是否在范围内
        binary_img = cv.inRange(hsv_img,lower_color,upper_color);

        # 闭操作
        kernel = cv.getStructuringElement(cv.MORPH_RECT,(5,10))
        binary_img = cv.morphologyEx(binary_img,cv.MORPH_CLOSE,kernel);
        # cv.imshow("binary",binary_img);
        # 查找矩形区域
        _,contours,_ = cv.findContours(binary_img,cv.RETR_EXTERNAL,cv.CHAIN_APPROX_SIMPLE);

        if len(contours) <=0:
            print("没有找到白色线")
            return self.STOP;

        max_area = 0;
        index = 0;

        for i,c in enumerate(contours):
            # 计算面积
            area = cv.contourArea(c);
            if area > max_area:
                max_area = area;
                index = i;

        # cv.imshow("color ",img);
        if max_area < 80:
            print("矩形太小")
            return self.STOP;

        # 计算矩形
        rect1 = cv.minAreaRect(contours[index]);
        # print(rect1)
        center_x = rect1[0][0];

        rect2 = cv.boundingRect(contours[index])
        cv.rectangle(gaussian,(rect2[0],rect2[1]),(rect2[0] + rect2[2],rect2[1] + rect2[3]),(255,0,0),2)
        cv.imshow("color ",gaussian);

        #print(rect1,center_x,width/2 - self.tolerance,width/2 + self.tolerance)
        # 获取矩形的中心点位置
        if center_x > width/2 - self.tolerance and center_x < width/2 + self.tolerance:
            return self.FRONT
        # 如果在中间 则执行
        elif center_x <= width/2 - self.tolerance:
        # 如果中心点，在屏幕的左侧，则左转
            return self.TURN_LEFT

        elif center_x >= width/2 + self.tolerance:
            # 如果中心点，在屏幕的右侧，则右转
            return self.TURN_RIGHT
        else:
            # 否则停止
            return self.STOP


class LineFollower:

    def __init__(self):
        # Give the node a name
        rospy.init_node('heima_linefollow', anonymous=False)

        # Set rospy to execute a shutdown function when terminating the script
        rospy.on_shutdown(self.shutdown)

        # How fast will we check the odometry values?
        self.rate = rospy.Rate(10)

        # Set the distance to travel
        self.speed_vel = 0.1 # meters per second
        self.speed_angle = 0.2

        # Publisher to control the robot's speed
        self.cmd_vel = rospy.Publisher('/cmd_vel', Twist, queue_size=1)

        self.sub_img = rospy.Subscriber('/camera/rgb/image_raw/compressed', CompressedImage, self.image_detect,queue_size=1,buff_size=250000)
        # self.sub = rospy.Subscriber("scan_filtered", LaserScan, self.laser_detect)
        #
        # self.start_test_distance = True;
        # self.start_test_angle = True;
        self.pub_img = rospy.Publisher('/line_img', CompressedImage, queue_size=1)

    def laser_detect(self, data):

        newdata = data
        #从消息中读取的距离和强度数据是tuple，需要转成list以便操作
        newdata.ranges = list(data.ranges)
        newdata.intensities = list(data.intensities)

        #通过清除不需要的扇区的数据来保留有效的数据
        # for x in range(120,240):
        #     newdata.ranges[x]=0
        #     newdata.intensities[x]=0

        #前方180°的扇区
        #for x in range(90,270):
        #    newdata.ranges[x]=0
        #    newdata.intensities[x]=0

        #正前方60°的扇区
        for x in range(0,30):
            if (self.start_test_distance or self.start_test_angle) and newdata.ranges[x] < 0.18 :
                self.cmd_vel.publish(Twist())
                self.start_test_angle = False;
                self.start_test_distance = False;
                print("激光雷达检测到前方即将发生碰撞，主动停止运动！")
        for x in range(330,360):
            if (self.start_test_distance or self.start_test_angle) and newdata.ranges[x] < 0.18 :
                self.cmd_vel.publish(Twist())
                self.start_test_angle = False;
                self.start_test_distance = False;
                print("激光雷达检测到前方即将发生碰撞，主动停止运动！")


        # 后方发生碰撞
        for x in range(175,185):
            if (self.start_test_distance or self.start_test_angle) and newdata.ranges[x] < 0.6 :
                self.cmd_vel.publish(Twist())
                self.start_test_angle = False;
                self.start_test_distance = False;
                print("激光雷达检测到 后方 即将发生碰撞，主动停止运动！")

        #self.pub.publish(newdata)


    def image_detect(self,data):
        line_detect = LineDetect();
        move_cmd = Twist();
        move_cmd.linear.x = 0;
        move_cmd.angular.z = 0;

        cvBridge = CvBridge()

        img = cvBridge.compressed_imgmsg_to_cv2(data,"bgr8")

        # 判断方向
        DIRECTION = line_detect.detect_line(img);

        print DIRECTION
        if DIRECTION == LineDetect.FRONT:
            move_cmd.linear.x = self.speed_vel;
            move_cmd.angular.z = 0

        elif DIRECTION == LineDetect.TURN_LEFT:
            move_cmd.linear.x = self.speed_vel;
            move_cmd.angular.z = self.speed_angle

        elif DIRECTION == LineDetect.TURN_RIGHT:
            move_cmd.linear.x = self.speed_vel;
            move_cmd.angular.z = -self.speed_angle

        else:
            move_cmd.linear.x = 0;
            move_cmd.angular.z = 0

        self.cmd_vel.publish(move_cmd);

        # 将处理之后
        #img_msg = cvBridge.cv2_to_compressed_imgmsg(img,"bgr8")
        #self.pub_img.publish(img_msg)

        cv.imshow("img",img);
        cv.waitKey(100)


    def run(self):
        pass
        # line_detect = LineDetect();
        # move_cmd = Twist();
        # move_cmd.linear.x = 0;
        # move_cmd.angular.z = 0;
        #
        # capture = cv.VideoCapture(2)
        #
        # if not capture.isOpened():
        #     print("摄像头没有打开")


        # while not rospy.is_shutdown():
        #
        #     if not self.start_test_distance :
        #         continue

            # 获取图像
         #   ok,img = capture.read();
        #     # 判断方向
        #     DIRECTION = line_detect.detect_line(img);
        #     if DIRECTION == LineDetect.FRONT:
        #         move_cmd.linear.x = self.speed_vel;
        #         move_cmd.angular.z = 0
        #
        #     elif DIRECTION == LineDetect.TURN_LEFT:
        #         move_cmd.linear.x = self.speed_vel;
        #         move_cmd.angular.z = self.speed_angle
        #
        #     elif DIRECTION == LineDetect.TURN_RIGHT:
        #         move_cmd.linear.x = self.speed_vel;
        #         move_cmd.angular.z = -self.speed_angle
        #
        #     else:
        #         move_cmd.linear.x = 0;
        #         move_cmd.angular.z = 0
        #     if self.start_test_angle or self.start_test_distance:
        #         self.cmd_vel.publish(move_cmd);
        #     self.rate.sleep();
        #     cv.waitKey(125)
        #
        # self.cmd_vel.publish(Twist());

    def shutdown(self):
        # Always stop the robot when shutting down the node
        rospy.loginfo("Stopping the robot...")
        self.cmd_vel.publish(Twist())
        rospy.sleep(1)
if __name__ == '__main__':

       follower = LineFollower();


       rospy.spin();


    # img = cv.imread("test.jpg")
    # height,width = img.shape[0:2]

    # ratio = 400/height;
    # print(height,width)
    # img = cv.pyrDown(img,(int(width*ratio),int(height*ratio)))
    #
    # line_follower.detect_line(img);
    #
    # cv.waitKey()