# CMake generated Testfile for 
# Source directory: /home/itcast/Desktop/heima_ws/src/imu_filter_madgwick
# Build directory: /home/itcast/Desktop/heima_ws/src/imu_filter_madgwick/cmake-build-debug
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_imu_filter_madgwick_gtest_imu_filter_madgwick-madgwick_test "/home/itcast/Desktop/heima_ws/src/imu_filter_madgwick/cmake-build-debug/catkin_generated/env_cached.sh" "/usr/bin/python2" "/opt/ros/kinetic/share/catkin/cmake/test/run_tests.py" "/home/itcast/Desktop/heima_ws/src/imu_filter_madgwick/cmake-build-debug/test_results/imu_filter_madgwick/gtest-imu_filter_madgwick-madgwick_test.xml" "--return-code" "/home/itcast/Desktop/heima_ws/src/imu_filter_madgwick/cmake-build-debug/devel/lib/imu_filter_madgwick/imu_filter_madgwick-madgwick_test --gtest_output=xml:/home/itcast/Desktop/heima_ws/src/imu_filter_madgwick/cmake-build-debug/test_results/imu_filter_madgwick/gtest-imu_filter_madgwick-madgwick_test.xml")
set_tests_properties(_ctest_imu_filter_madgwick_gtest_imu_filter_madgwick-madgwick_test PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/kinetic/share/catkin/cmake/test/tests.cmake;143;add_test;/opt/ros/kinetic/share/catkin/cmake/test/gtest.cmake;89;catkin_run_tests_target;/opt/ros/kinetic/share/catkin/cmake/test/gtest.cmake;28;_catkin_add_google_test;/home/itcast/Desktop/heima_ws/src/imu_filter_madgwick/CMakeLists.txt;60;catkin_add_gtest;/home/itcast/Desktop/heima_ws/src/imu_filter_madgwick/CMakeLists.txt;0;")
subdirs("gtest")