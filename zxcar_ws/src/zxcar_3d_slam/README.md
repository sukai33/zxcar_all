#RIKIROBOT 3D-SLAM using RTAB-Map with Jetson TX2

## Quick Start:

```
mkdir catkin_ws/src -p
cd catkin_ws
wstool init src
wstool merge -t src https://raw.githubusercontent.com/ykevin/rikirobot_slam_3d/master/.rosinstall
wstool update -t src
rosdep install -y -r --from-paths src --ignore-src
catkin build rikirobot_slam_3d
```


