; Auto-generated. Do not edit!


(cl:in-package package1-srv)


;//! \htmlinclude Nav-request.msg.html

(cl:defclass <Nav-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:integer
    :initform 0)
   (y
    :reader y
    :initarg :y
    :type cl:integer
    :initform 0))
)

(cl:defclass Nav-request (<Nav-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Nav-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Nav-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name package1-srv:<Nav-request> is deprecated: use package1-srv:Nav-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <Nav-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader package1-srv:x-val is deprecated.  Use package1-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <Nav-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader package1-srv:y-val is deprecated.  Use package1-srv:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Nav-request>) ostream)
  "Serializes a message object of type '<Nav-request>"
  (cl:let* ((signed (cl:slot-value msg 'x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Nav-request>) istream)
  "Deserializes a message object of type '<Nav-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Nav-request>)))
  "Returns string type for a service object of type '<Nav-request>"
  "package1/NavRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Nav-request)))
  "Returns string type for a service object of type 'Nav-request"
  "package1/NavRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Nav-request>)))
  "Returns md5sum for a message object of type '<Nav-request>"
  "3de51ac40d2fb192c2025702c11f2ede")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Nav-request)))
  "Returns md5sum for a message object of type 'Nav-request"
  "3de51ac40d2fb192c2025702c11f2ede")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Nav-request>)))
  "Returns full string definition for message of type '<Nav-request>"
  (cl:format cl:nil "int64 x~%int64 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Nav-request)))
  "Returns full string definition for message of type 'Nav-request"
  (cl:format cl:nil "int64 x~%int64 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Nav-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Nav-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Nav-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
))
;//! \htmlinclude Nav-response.msg.html

(cl:defclass <Nav-response> (roslisp-msg-protocol:ros-message)
  ((p
    :reader p
    :initarg :p
    :type cl:integer
    :initform 0))
)

(cl:defclass Nav-response (<Nav-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Nav-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Nav-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name package1-srv:<Nav-response> is deprecated: use package1-srv:Nav-response instead.")))

(cl:ensure-generic-function 'p-val :lambda-list '(m))
(cl:defmethod p-val ((m <Nav-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader package1-srv:p-val is deprecated.  Use package1-srv:p instead.")
  (p m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Nav-response>) ostream)
  "Serializes a message object of type '<Nav-response>"
  (cl:let* ((signed (cl:slot-value msg 'p)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Nav-response>) istream)
  "Deserializes a message object of type '<Nav-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'p) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Nav-response>)))
  "Returns string type for a service object of type '<Nav-response>"
  "package1/NavResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Nav-response)))
  "Returns string type for a service object of type 'Nav-response"
  "package1/NavResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Nav-response>)))
  "Returns md5sum for a message object of type '<Nav-response>"
  "3de51ac40d2fb192c2025702c11f2ede")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Nav-response)))
  "Returns md5sum for a message object of type 'Nav-response"
  "3de51ac40d2fb192c2025702c11f2ede")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Nav-response>)))
  "Returns full string definition for message of type '<Nav-response>"
  (cl:format cl:nil "int64 p~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Nav-response)))
  "Returns full string definition for message of type 'Nav-response"
  (cl:format cl:nil "int64 p~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Nav-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Nav-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Nav-response
    (cl:cons ':p (p msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Nav)))
  'Nav-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Nav)))
  'Nav-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Nav)))
  "Returns string type for a service object of type '<Nav>"
  "package1/Nav")