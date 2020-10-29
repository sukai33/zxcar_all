# zxcar_all
与aslam相关的多个项目
\day04\src\zxcar\param\ekf\robot_localization.yaml 卡尔曼滤波的配置 官网拷贝

\day04\src\zxcar\param\imu\imu_calib.yaml  imu陀螺仪的数据自己生成的,角速度,线速度标定

day04\src\zxcar\param\navigation\4wd 4驱小车的配置

day04\src\zxcar\param\navigation\4wd\base_local_planner_params.yaml 4驱小车的配置:默认参数官网直接拷贝

day04\src\zxcar\param\navigation\4wd\costmap_common_params.yaml 4驱小车的配置:

1. 在里面改一下机器人尺寸

   footprint: [[-0.09, -0.125], [-0.09, 0.125], [0.09, 0.125], [0.09, -0.125]]

   ![image-20201028215800092](C:\Users\95444\AppData\Roaming\Typora\typora-user-images\image-20201028215800092.png)

![image-20201028220034478](C:\Users\95444\AppData\Roaming\Typora\typora-user-images\image-20201028220034478.png)



day04\src\zxcar\param\navigation\move_base.xml

配置4轮参数:

![image-20201028220308854](C:\Users\95444\AppData\Roaming\Typora\typora-user-images\image-20201028220308854.png)



day04\src\zxcar\launch\lidar\rplidar.launch

激光雷达串口配置

![image-20201028220621134](C:\Users\95444\AppData\Roaming\Typora\typora-user-images\image-20201028220621134.png)

day04\src\zxcar\launch\lidar_slam.launch 改slam算法  slam_gmapping.xml

![image-20201028224013100](C:\Users\95444\AppData\Roaming\Typora\typora-user-images\image-20201028224013100.png)



保存地图

day04\src\zxcar\maps

./map.sh



我们这里默认使用的是gmapping建图算法

rosluanch heimarobot lidar_slam.launch 

然后执行rviz我们可以查看建图相关的数据

roslaunch heimarobot lidar_slam_rviz.launch

在开启一个命令行窗口,打开我们的键盘控制程序,让小车随意溜达一圈

rosrun teleop_twist_keyboard teleop_twist_keyboard.py 

当所有的地图边缘都已经闭合之后,我们就可以执行程序来保存地图, 

roscd heimarobot/maps 

day04\src\zxcar\maps

./map.sh

![image-20201028221207508](C:\Users\95444\AppData\Roaming\Typora\typora-user-images\image-20201028221207508.png)

**自动避障导航**

启动导航节点: 执行下面这条命令,打开自动导航程序

roslaunch heimarobot navigate.launch

![image-20201028221304973](C:\Users\95444\AppData\Roaming\Typora\typora-user-images\image-20201028221304973.png)

执行下面这条命令,打开导航rviz窗口

roslaunch heimarobot navigate_rviz.launch

![image-20201028221425641](C:\Users\95444\AppData\Roaming\Typora\typora-user-images\image-20201028221425641.png)

![image-20201028221442361](C:\Users\95444\AppData\Roaming\Typora\typora-user-images\image-20201028221442361.png)



![image-20201028225452301](C:\Users\95444\AppData\Roaming\Typora\typora-user-images\image-20201028225452301.png)

![image-20201028225654254](C:\Users\95444\AppData\Roaming\Typora\typora-user-images\image-20201028225654254.png)    描述了陀螺仪相对于机器人坐标系的对应关系



![image-20201028225840098](C:\Users\95444\AppData\Roaming\Typora\typora-user-images\image-20201028225840098.png)  收到线速度和角速度后算出它的里程计信息,从机器人开机的位置算到它当前的位置,机器人走了多远,转过的角度

![image-20201028230028445](C:\Users\95444\AppData\Roaming\Typora\typora-user-images\image-20201028230028445.png)  传感器数据

laserScan 激光雷达数据

pointCloud 点云数据  还可以加其他数据

把数据全部输入move_base

global_planner 全局路径规划

local_planner 局部路径规划

global_costmap 全局地图

local_costmap 局部地图

![image-20201028230507100](C:\Users\95444\AppData\Roaming\Typora\typora-user-images\image-20201028230507100.png)  把数据融合在一起输出





day04\src\zxcar\launch\lidar_slam.launch 建图

day04\src\zxcar\launch\navigate.launch    导航



http://wiki.ros.org/navigation/Tutorials/RobotSetup 机器人导航的配置教你怎么配置一个机器人出来



**代码实现导航**



\#!/usr/bin/env python 

\# -*- coding: utf-8 -*- 

import rospy 

import actionlib 

from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal 

from actionlib_msgs.msg import * 

from geometry_msgs.msg import Point 

\# 导航移动api 

def move_to_goal(xGoal,yGoal): 

\#simpleactionclient 

ac = actionlib.SimpleActionClient("move_base", 

MoveBaseAction) 

\#等待5秒 ,actionserver启动 

while(not ac.wait_for_server(rospy.Duration.from_sec(5.0))): 

rospy.loginfo("等待move_base actionserver启动") 

goal = MoveBaseGoal() 

\#指定地图参考系 

goal.target_pose.header.frame_id = "map" 

goal.target_pose.header.stamp = rospy.Time.now() 

\#移动目标设定位姿 xyz和四元数 

goal.target_pose.pose.position = Point(xGoal,yGoal,0) 

goal.target_pose.pose.orientation.x = 0.0 

goal.target_pose.pose.orientation.y = 0.0 

goal.target_pose.pose.orientation.z = 0.0 

goal.target_pose.pose.orientation.w = 1.0 

rospy.loginfo("发送目标到actionserver ...") 

ac.send_goal(goal)

\#设置超时时间为60s 

ac.wait_for_result(rospy.Duration(60)) 

if(ac.get_state() == GoalStatus.SUCCEEDED): 

rospy.loginfo("成功到达") 

return True 

else:

rospy.loginfo("未在规定时间内到达目的地,失败了") 

return False 

if __name__ == '__main__': 

rospy.init_node('map_navigation', anonymous=False) 

x_goal = 1 

y_goal = 0 

print'start go to goal' 

move_to_goal(x_goal,y_goal) 

rospy.spin() 



执行如下代码即可让小车运动到指定的地图坐标：

kaijun@kaijun-pc:~/Documents/slam/slam_ws$ rosrun heima_slam 

slam_demo.py 





  1、Gmapping是基于**滤波SLAM框架**的常用开源SLAM算法。

   2、Gmapping基于**RBpf粒子滤波算法**，即将定位和建图过程分离，先进行定位再进行建图。

   3、Gmapping在RBpf算法上做了两个主要的改进：**改进提议分布**和**选择性重采样**。

1.为什么RBpf可以将定位和建图分离；

2.Gmapping是如何在RBpf的基础改进提议分布的；


3.为什么要执行选择性重采样；
粒子退化主要指正确的粒子被丢弃和粒子多样性减小，而频繁重采样则加剧了正确的粒子被丢弃的可能性和粒子多样性减小速率。
防止粒子退化
选择性重采样通过设定阈值，只有在粒子权重变化超过阈值时才执行重采样从而大大减少重采样的次数。

4.什么是粒子退化及如何防止粒子退化；
粒子退化主要指正确的粒子被丢弃和粒子多样性减小，而频繁重采样则加剧了正确的粒子被丢弃的可能性和粒子多样性减小速率。
频繁执行重采样会造成粒子退化.
因此Gmapping在RBpf的基础上改进提议分布和选择性重采样，从而减少粒子个数和防止粒子退化。

5.为什么Gmapping严重依赖里程计；
6.什么是提议分布；
提议分布进行采样来获取下一时刻机器人位姿信息。答案是没有办法直接对目标分布建模进行采样。
提议分布被提出来代替目标分布来提取下一时刻机器人位姿信息。而提议分布毕竟不是目标分布因此使用粒子权重来表征提议分布和目标分布的不一致性。  
7.什么是目标分布；
就是我根据机器人携带的所有传感器的数据能确定机器人状态置信度的最大极限。

8.为什么需要提议分布和目标分布；
改进的提议分布不但考虑运动（里程计）信息还考虑最近的一次观测（激光）信息这样就可以使提议分布的更加精确从而更加接近目标分布。

9.算法中是如何计算权重；
10.粒子滤波粒子数和传感器精度的关系；
11.为什么在有大回环的环境中增加粒子数可以使建出的地图正确闭合；
12.Gmapping是基于滤波框架的SLAM方法，为什么建图过程中界面上显示的地图在不断调整。
