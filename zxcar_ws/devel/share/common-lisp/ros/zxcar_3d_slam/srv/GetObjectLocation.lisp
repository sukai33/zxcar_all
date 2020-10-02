; Auto-generated. Do not edit!


(cl:in-package zxcar_3d_slam-srv)


;//! \htmlinclude GetObjectLocation-request.msg.html

(cl:defclass <GetObjectLocation-request> (roslisp-msg-protocol:ros-message)
  ((object_name
    :reader object_name
    :initarg :object_name
    :type cl:string
    :initform ""))
)

(cl:defclass GetObjectLocation-request (<GetObjectLocation-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetObjectLocation-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetObjectLocation-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name zxcar_3d_slam-srv:<GetObjectLocation-request> is deprecated: use zxcar_3d_slam-srv:GetObjectLocation-request instead.")))

(cl:ensure-generic-function 'object_name-val :lambda-list '(m))
(cl:defmethod object_name-val ((m <GetObjectLocation-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zxcar_3d_slam-srv:object_name-val is deprecated.  Use zxcar_3d_slam-srv:object_name instead.")
  (object_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetObjectLocation-request>) ostream)
  "Serializes a message object of type '<GetObjectLocation-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'object_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'object_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetObjectLocation-request>) istream)
  "Deserializes a message object of type '<GetObjectLocation-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'object_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'object_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetObjectLocation-request>)))
  "Returns string type for a service object of type '<GetObjectLocation-request>"
  "zxcar_3d_slam/GetObjectLocationRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetObjectLocation-request)))
  "Returns string type for a service object of type 'GetObjectLocation-request"
  "zxcar_3d_slam/GetObjectLocationRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetObjectLocation-request>)))
  "Returns md5sum for a message object of type '<GetObjectLocation-request>"
  "9d28df3ac07730491ae5838769a77b6a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetObjectLocation-request)))
  "Returns md5sum for a message object of type 'GetObjectLocation-request"
  "9d28df3ac07730491ae5838769a77b6a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetObjectLocation-request>)))
  "Returns full string definition for message of type '<GetObjectLocation-request>"
  (cl:format cl:nil "string object_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetObjectLocation-request)))
  "Returns full string definition for message of type 'GetObjectLocation-request"
  (cl:format cl:nil "string object_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetObjectLocation-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'object_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetObjectLocation-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetObjectLocation-request
    (cl:cons ':object_name (object_name msg))
))
;//! \htmlinclude GetObjectLocation-response.msg.html

(cl:defclass <GetObjectLocation-response> (roslisp-msg-protocol:ros-message)
  ((location
    :reader location
    :initarg :location
    :type geometry_msgs-msg:PoseArray
    :initform (cl:make-instance 'geometry_msgs-msg:PoseArray)))
)

(cl:defclass GetObjectLocation-response (<GetObjectLocation-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetObjectLocation-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetObjectLocation-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name zxcar_3d_slam-srv:<GetObjectLocation-response> is deprecated: use zxcar_3d_slam-srv:GetObjectLocation-response instead.")))

(cl:ensure-generic-function 'location-val :lambda-list '(m))
(cl:defmethod location-val ((m <GetObjectLocation-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zxcar_3d_slam-srv:location-val is deprecated.  Use zxcar_3d_slam-srv:location instead.")
  (location m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetObjectLocation-response>) ostream)
  "Serializes a message object of type '<GetObjectLocation-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'location) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetObjectLocation-response>) istream)
  "Deserializes a message object of type '<GetObjectLocation-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'location) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetObjectLocation-response>)))
  "Returns string type for a service object of type '<GetObjectLocation-response>"
  "zxcar_3d_slam/GetObjectLocationResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetObjectLocation-response)))
  "Returns string type for a service object of type 'GetObjectLocation-response"
  "zxcar_3d_slam/GetObjectLocationResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetObjectLocation-response>)))
  "Returns md5sum for a message object of type '<GetObjectLocation-response>"
  "9d28df3ac07730491ae5838769a77b6a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetObjectLocation-response)))
  "Returns md5sum for a message object of type 'GetObjectLocation-response"
  "9d28df3ac07730491ae5838769a77b6a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetObjectLocation-response>)))
  "Returns full string definition for message of type '<GetObjectLocation-response>"
  (cl:format cl:nil "geometry_msgs/PoseArray location~%~%================================================================================~%MSG: geometry_msgs/PoseArray~%# An array of poses with a header for global reference.~%~%Header header~%~%Pose[] poses~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetObjectLocation-response)))
  "Returns full string definition for message of type 'GetObjectLocation-response"
  (cl:format cl:nil "geometry_msgs/PoseArray location~%~%================================================================================~%MSG: geometry_msgs/PoseArray~%# An array of poses with a header for global reference.~%~%Header header~%~%Pose[] poses~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetObjectLocation-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'location))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetObjectLocation-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetObjectLocation-response
    (cl:cons ':location (location msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetObjectLocation)))
  'GetObjectLocation-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetObjectLocation)))
  'GetObjectLocation-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetObjectLocation)))
  "Returns string type for a service object of type '<GetObjectLocation>"
  "zxcar_3d_slam/GetObjectLocation")