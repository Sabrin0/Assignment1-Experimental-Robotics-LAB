; Auto-generated. Do not edit!


(cl:in-package package1-srv)


;//! \htmlinclude Nav-request.msg.html

(cl:defclass <Nav-request> (roslisp-msg-protocol:ros-message)
  ((in
    :reader in
    :initarg :in
    :type package1-msg:Position
    :initform (cl:make-instance 'package1-msg:Position)))
)

(cl:defclass Nav-request (<Nav-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Nav-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Nav-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name package1-srv:<Nav-request> is deprecated: use package1-srv:Nav-request instead.")))

(cl:ensure-generic-function 'in-val :lambda-list '(m))
(cl:defmethod in-val ((m <Nav-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader package1-srv:in-val is deprecated.  Use package1-srv:in instead.")
  (in m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Nav-request>) ostream)
  "Serializes a message object of type '<Nav-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'in) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Nav-request>) istream)
  "Deserializes a message object of type '<Nav-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'in) istream)
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
  "ecf3a247110a76fb77a2db5d9c8c5101")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Nav-request)))
  "Returns md5sum for a message object of type 'Nav-request"
  "ecf3a247110a76fb77a2db5d9c8c5101")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Nav-request>)))
  "Returns full string definition for message of type '<Nav-request>"
  (cl:format cl:nil "package1/Position in~%~%================================================================================~%MSG: package1/Position~%int64 x~%int64 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Nav-request)))
  "Returns full string definition for message of type 'Nav-request"
  (cl:format cl:nil "package1/Position in~%~%================================================================================~%MSG: package1/Position~%int64 x~%int64 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Nav-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'in))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Nav-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Nav-request
    (cl:cons ':in (in msg))
))
;//! \htmlinclude Nav-response.msg.html

(cl:defclass <Nav-response> (roslisp-msg-protocol:ros-message)
  ((out
    :reader out
    :initarg :out
    :type package1-msg:NewPosition
    :initform (cl:make-instance 'package1-msg:NewPosition)))
)

(cl:defclass Nav-response (<Nav-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Nav-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Nav-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name package1-srv:<Nav-response> is deprecated: use package1-srv:Nav-response instead.")))

(cl:ensure-generic-function 'out-val :lambda-list '(m))
(cl:defmethod out-val ((m <Nav-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader package1-srv:out-val is deprecated.  Use package1-srv:out instead.")
  (out m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Nav-response>) ostream)
  "Serializes a message object of type '<Nav-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'out) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Nav-response>) istream)
  "Deserializes a message object of type '<Nav-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'out) istream)
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
  "ecf3a247110a76fb77a2db5d9c8c5101")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Nav-response)))
  "Returns md5sum for a message object of type 'Nav-response"
  "ecf3a247110a76fb77a2db5d9c8c5101")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Nav-response>)))
  "Returns full string definition for message of type '<Nav-response>"
  (cl:format cl:nil "package1/NewPosition out~%~%~%~%~%================================================================================~%MSG: package1/NewPosition~%int64 nx~%int64 ny~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Nav-response)))
  "Returns full string definition for message of type 'Nav-response"
  (cl:format cl:nil "package1/NewPosition out~%~%~%~%~%================================================================================~%MSG: package1/NewPosition~%int64 nx~%int64 ny~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Nav-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'out))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Nav-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Nav-response
    (cl:cons ':out (out msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Nav)))
  'Nav-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Nav)))
  'Nav-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Nav)))
  "Returns string type for a service object of type '<Nav>"
  "package1/Nav")