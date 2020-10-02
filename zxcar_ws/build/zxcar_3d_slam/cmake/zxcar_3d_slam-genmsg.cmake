# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "zxcar_3d_slam: 0 messages, 1 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(zxcar_3d_slam_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/zxcar/zxcar_ws/src/zxcar_3d_slam/srv/GetObjectLocation.srv" NAME_WE)
add_custom_target(_zxcar_3d_slam_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "zxcar_3d_slam" "/home/zxcar/zxcar_ws/src/zxcar_3d_slam/srv/GetObjectLocation.srv" "geometry_msgs/Pose:std_msgs/Header:geometry_msgs/Point:geometry_msgs/Quaternion:geometry_msgs/PoseArray"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(zxcar_3d_slam
  "/home/zxcar/zxcar_ws/src/zxcar_3d_slam/srv/GetObjectLocation.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/zxcar_3d_slam
)

### Generating Module File
_generate_module_cpp(zxcar_3d_slam
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/zxcar_3d_slam
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(zxcar_3d_slam_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(zxcar_3d_slam_generate_messages zxcar_3d_slam_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zxcar/zxcar_ws/src/zxcar_3d_slam/srv/GetObjectLocation.srv" NAME_WE)
add_dependencies(zxcar_3d_slam_generate_messages_cpp _zxcar_3d_slam_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(zxcar_3d_slam_gencpp)
add_dependencies(zxcar_3d_slam_gencpp zxcar_3d_slam_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS zxcar_3d_slam_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(zxcar_3d_slam
  "/home/zxcar/zxcar_ws/src/zxcar_3d_slam/srv/GetObjectLocation.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/zxcar_3d_slam
)

### Generating Module File
_generate_module_eus(zxcar_3d_slam
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/zxcar_3d_slam
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(zxcar_3d_slam_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(zxcar_3d_slam_generate_messages zxcar_3d_slam_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zxcar/zxcar_ws/src/zxcar_3d_slam/srv/GetObjectLocation.srv" NAME_WE)
add_dependencies(zxcar_3d_slam_generate_messages_eus _zxcar_3d_slam_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(zxcar_3d_slam_geneus)
add_dependencies(zxcar_3d_slam_geneus zxcar_3d_slam_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS zxcar_3d_slam_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(zxcar_3d_slam
  "/home/zxcar/zxcar_ws/src/zxcar_3d_slam/srv/GetObjectLocation.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/zxcar_3d_slam
)

### Generating Module File
_generate_module_lisp(zxcar_3d_slam
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/zxcar_3d_slam
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(zxcar_3d_slam_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(zxcar_3d_slam_generate_messages zxcar_3d_slam_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zxcar/zxcar_ws/src/zxcar_3d_slam/srv/GetObjectLocation.srv" NAME_WE)
add_dependencies(zxcar_3d_slam_generate_messages_lisp _zxcar_3d_slam_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(zxcar_3d_slam_genlisp)
add_dependencies(zxcar_3d_slam_genlisp zxcar_3d_slam_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS zxcar_3d_slam_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(zxcar_3d_slam
  "/home/zxcar/zxcar_ws/src/zxcar_3d_slam/srv/GetObjectLocation.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/zxcar_3d_slam
)

### Generating Module File
_generate_module_nodejs(zxcar_3d_slam
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/zxcar_3d_slam
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(zxcar_3d_slam_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(zxcar_3d_slam_generate_messages zxcar_3d_slam_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zxcar/zxcar_ws/src/zxcar_3d_slam/srv/GetObjectLocation.srv" NAME_WE)
add_dependencies(zxcar_3d_slam_generate_messages_nodejs _zxcar_3d_slam_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(zxcar_3d_slam_gennodejs)
add_dependencies(zxcar_3d_slam_gennodejs zxcar_3d_slam_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS zxcar_3d_slam_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(zxcar_3d_slam
  "/home/zxcar/zxcar_ws/src/zxcar_3d_slam/srv/GetObjectLocation.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/zxcar_3d_slam
)

### Generating Module File
_generate_module_py(zxcar_3d_slam
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/zxcar_3d_slam
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(zxcar_3d_slam_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(zxcar_3d_slam_generate_messages zxcar_3d_slam_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zxcar/zxcar_ws/src/zxcar_3d_slam/srv/GetObjectLocation.srv" NAME_WE)
add_dependencies(zxcar_3d_slam_generate_messages_py _zxcar_3d_slam_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(zxcar_3d_slam_genpy)
add_dependencies(zxcar_3d_slam_genpy zxcar_3d_slam_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS zxcar_3d_slam_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/zxcar_3d_slam)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/zxcar_3d_slam
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(zxcar_3d_slam_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(zxcar_3d_slam_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/zxcar_3d_slam)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/zxcar_3d_slam
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(zxcar_3d_slam_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(zxcar_3d_slam_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/zxcar_3d_slam)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/zxcar_3d_slam
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(zxcar_3d_slam_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(zxcar_3d_slam_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/zxcar_3d_slam)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/zxcar_3d_slam
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(zxcar_3d_slam_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(zxcar_3d_slam_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/zxcar_3d_slam)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/zxcar_3d_slam\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/zxcar_3d_slam
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(zxcar_3d_slam_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(zxcar_3d_slam_generate_messages_py geometry_msgs_generate_messages_py)
endif()
