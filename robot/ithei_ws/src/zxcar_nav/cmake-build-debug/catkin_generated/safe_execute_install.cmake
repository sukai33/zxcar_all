execute_process(COMMAND "/home/itcast/Desktop/heima_ws/src/zxcar_nav/cmake-build-debug/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/itcast/Desktop/heima_ws/src/zxcar_nav/cmake-build-debug/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
