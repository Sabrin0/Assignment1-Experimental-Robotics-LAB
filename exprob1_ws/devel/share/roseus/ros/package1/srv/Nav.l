;; Auto-generated. Do not edit!


(when (boundp 'package1::Nav)
  (if (not (find-package "PACKAGE1"))
    (make-package "PACKAGE1"))
  (shadow 'Nav (find-package "PACKAGE1")))
(unless (find-package "PACKAGE1::NAV")
  (make-package "PACKAGE1::NAV"))
(unless (find-package "PACKAGE1::NAVREQUEST")
  (make-package "PACKAGE1::NAVREQUEST"))
(unless (find-package "PACKAGE1::NAVRESPONSE")
  (make-package "PACKAGE1::NAVRESPONSE"))

(in-package "ROS")





(defclass package1::NavRequest
  :super ros::object
  :slots (_in ))

(defmethod package1::NavRequest
  (:init
   (&key
    ((:in __in) (instance package1::Position :init))
    )
   (send-super :init)
   (setq _in __in)
   self)
  (:in
   (&rest __in)
   (if (keywordp (car __in))
       (send* _in __in)
     (progn
       (if __in (setq _in (car __in)))
       _in)))
  (:serialization-length
   ()
   (+
    ;; package1/Position _in
    (send _in :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; package1/Position _in
       (send _in :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; package1/Position _in
     (send _in :deserialize buf ptr-) (incf ptr- (send _in :serialization-length))
   ;;
   self)
  )

(defclass package1::NavResponse
  :super ros::object
  :slots (_out ))

(defmethod package1::NavResponse
  (:init
   (&key
    ((:out __out) (instance package1::NewPosition :init))
    )
   (send-super :init)
   (setq _out __out)
   self)
  (:out
   (&rest __out)
   (if (keywordp (car __out))
       (send* _out __out)
     (progn
       (if __out (setq _out (car __out)))
       _out)))
  (:serialization-length
   ()
   (+
    ;; package1/NewPosition _out
    (send _out :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; package1/NewPosition _out
       (send _out :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; package1/NewPosition _out
     (send _out :deserialize buf ptr-) (incf ptr- (send _out :serialization-length))
   ;;
   self)
  )

(defclass package1::Nav
  :super ros::object
  :slots ())

(setf (get package1::Nav :md5sum-) "ecf3a247110a76fb77a2db5d9c8c5101")
(setf (get package1::Nav :datatype-) "package1/Nav")
(setf (get package1::Nav :request) package1::NavRequest)
(setf (get package1::Nav :response) package1::NavResponse)

(defmethod package1::NavRequest
  (:response () (instance package1::NavResponse :init)))

(setf (get package1::NavRequest :md5sum-) "ecf3a247110a76fb77a2db5d9c8c5101")
(setf (get package1::NavRequest :datatype-) "package1/NavRequest")
(setf (get package1::NavRequest :definition-)
      "package1/Position in

================================================================================
MSG: package1/Position
int64 x
int64 y
---
package1/NewPosition out




================================================================================
MSG: package1/NewPosition
int64 nx
int64 ny
")

(setf (get package1::NavResponse :md5sum-) "ecf3a247110a76fb77a2db5d9c8c5101")
(setf (get package1::NavResponse :datatype-) "package1/NavResponse")
(setf (get package1::NavResponse :definition-)
      "package1/Position in

================================================================================
MSG: package1/Position
int64 x
int64 y
---
package1/NewPosition out




================================================================================
MSG: package1/NewPosition
int64 nx
int64 ny
")



(provide :package1/Nav "ecf3a247110a76fb77a2db5d9c8c5101")


