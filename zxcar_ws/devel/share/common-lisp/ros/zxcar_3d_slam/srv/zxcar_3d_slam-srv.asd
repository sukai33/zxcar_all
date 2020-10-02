
(cl:in-package :asdf)

(defsystem "zxcar_3d_slam-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "GetObjectLocation" :depends-on ("_package_GetObjectLocation"))
    (:file "_package_GetObjectLocation" :depends-on ("_package"))
  ))