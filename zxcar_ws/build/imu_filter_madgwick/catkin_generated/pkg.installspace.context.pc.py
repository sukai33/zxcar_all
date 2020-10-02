# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include;/usr/include".split(';') if "${prefix}/include;/usr/include" != "" else []
PROJECT_CATKIN_DEPENDS = "roscpp;sensor_msgs;geometry_msgs;tf2_ros;tf2_geometry_msgs;nodelet;pluginlib;message_filters;dynamic_reconfigure".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-limu_filter;-limu_filter_nodelet;/usr/lib/aarch64-linux-gnu/libboost_system.so;/usr/lib/aarch64-linux-gnu/libboost_thread.so;/usr/lib/aarch64-linux-gnu/libboost_signals.so;/usr/lib/aarch64-linux-gnu/libboost_chrono.so;/usr/lib/aarch64-linux-gnu/libboost_date_time.so;/usr/lib/aarch64-linux-gnu/libboost_atomic.so;/usr/lib/aarch64-linux-gnu/libpthread.so".split(';') if "-limu_filter;-limu_filter_nodelet;/usr/lib/aarch64-linux-gnu/libboost_system.so;/usr/lib/aarch64-linux-gnu/libboost_thread.so;/usr/lib/aarch64-linux-gnu/libboost_signals.so;/usr/lib/aarch64-linux-gnu/libboost_chrono.so;/usr/lib/aarch64-linux-gnu/libboost_date_time.so;/usr/lib/aarch64-linux-gnu/libboost_atomic.so;/usr/lib/aarch64-linux-gnu/libpthread.so" != "" else []
PROJECT_NAME = "imu_filter_madgwick"
PROJECT_SPACE_DIR = "/home/zxcar/zxcar_ws/install"
PROJECT_VERSION = "1.1.6"
