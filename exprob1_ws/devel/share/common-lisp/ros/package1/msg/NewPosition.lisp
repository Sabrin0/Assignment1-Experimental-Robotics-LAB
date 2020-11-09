; Auto-generated. Do not edit!


(cl:in-package package1-msg)


;//! \htmlinclude NewPosition.msg.html

(cl:defclass <NewPosition> (roslisp-msg-protocol:ros-message)
  ((nx
    :reader nx
    :initarg :nx
    :type cl:integer
    :initform 0)
   (ny
    :reader ny
    :initarg :ny
    :type cl:integer
    :initform 0))
)

(cl:defclass NewPosition (<NewPosition>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NewPosition>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NewPosition)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name package1-msg:<NewPosition> is deprecated: use package1-msg:NewPosition instead.")))

(cl:ensure-generic-function 'nx-val :lambda-list '(m))
(cl:defmethod nx-val ((m <NewPosition>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader package1-msg:nx-val is deprecated.  Use package1-msg:nx instead.")
  (nx m))

(cl:ensure-generic-function 'ny-val :lambda-list '(m))
(cl:defmethod ny-val ((m <NewPosition>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader package1-msg:ny-val is deprecated.  Use package1-msg:ny instead.")
  (ny m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NewPosition>) ostream)
  "Serializes a message object of type '<NewPosition>"
  (cl:let* ((signed (cl:slot-value msg 'nx)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'ny)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NewPosition>) istream)
  "Deserializes a message object of type '<NewPosition>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nx) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ny) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NewPosition>)))
  "Returns string type for a message object of type '<NewPosition>"
  "package1/NewPosition")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NewPosition)))
  "Returns string type for a message object of type 'NewPosition"
  "package1/NewPosition")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NewPosition>)))
  "Returns md5sum for a message object of type '<NewPosition>"
  "865ef1ea904ca728a90504003d8b9fb0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NewPosition)))
  "Returns md5sum for a message object of type 'NewPosition"
  "865ef1ea904ca728a90504003d8b9fb0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NewPosition>)))
  "Returns full string definition for message of type '<NewPosition>"
  (cl:format cl:nil "int64 nx~%int64 ny~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NewPosition)))
  "Returns full string definition for message of type 'NewPosition"
  (cl:format cl:nil "int64 nx~%int64 ny~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NewPosition>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NewPosition>))
  "Converts a ROS message object to a list"
  (cl:list 'NewPosition
    (cl:cons ':nx (nx msg))
    (cl:cons ':ny (ny msg))
))
