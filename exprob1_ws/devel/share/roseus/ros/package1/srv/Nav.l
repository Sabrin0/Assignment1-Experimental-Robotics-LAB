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
  :slots (_x _y ))

(defmethod package1::NavRequest
  (:init
   (&key
    ((:x __x) 0)
    ((:y __y) 0)
    )
   (send-super :init)
   (setq _x (round __x))
   (setq _y (round __y))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:serialization-length
   ()
   (+
    ;; int64 _x
    8
    ;; int64 _y
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _x
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _x (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _x) (= (length (_x . bv)) 2)) ;; bignum
              (write-long (ash (elt (_x . bv) 0) 0) s)
              (write-long (ash (elt (_x . bv) 1) -1) s))
             ((and (class _x) (= (length (_x . bv)) 1)) ;; big1
              (write-long (elt (_x . bv) 0) s)
              (write-long (if (>= _x 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _x s)(write-long (if (>= _x 0) 0 #xffffffff) s)))
     ;; int64 _y
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _y (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _y) (= (length (_y . bv)) 2)) ;; bignum
              (write-long (ash (elt (_y . bv) 0) 0) s)
              (write-long (ash (elt (_y . bv) 1) -1) s))
             ((and (class _y) (= (length (_y . bv)) 1)) ;; big1
              (write-long (elt (_y . bv) 0) s)
              (write-long (if (>= _y 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _y s)(write-long (if (>= _y 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _x
#+(or :alpha :irix6 :x86_64)
      (setf _x (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _x (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _y
#+(or :alpha :irix6 :x86_64)
      (setf _y (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _y (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass package1::NavResponse
  :super ros::object
  :slots (_p ))

(defmethod package1::NavResponse
  (:init
   (&key
    ((:p __p) 0)
    )
   (send-super :init)
   (setq _p (round __p))
   self)
  (:p
   (&optional __p)
   (if __p (setq _p __p)) _p)
  (:serialization-length
   ()
   (+
    ;; int64 _p
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _p
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _p (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _p) (= (length (_p . bv)) 2)) ;; bignum
              (write-long (ash (elt (_p . bv) 0) 0) s)
              (write-long (ash (elt (_p . bv) 1) -1) s))
             ((and (class _p) (= (length (_p . bv)) 1)) ;; big1
              (write-long (elt (_p . bv) 0) s)
              (write-long (if (>= _p 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _p s)(write-long (if (>= _p 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _p
#+(or :alpha :irix6 :x86_64)
      (setf _p (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _p (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass package1::Nav
  :super ros::object
  :slots ())

(setf (get package1::Nav :md5sum-) "3de51ac40d2fb192c2025702c11f2ede")
(setf (get package1::Nav :datatype-) "package1/Nav")
(setf (get package1::Nav :request) package1::NavRequest)
(setf (get package1::Nav :response) package1::NavResponse)

(defmethod package1::NavRequest
  (:response () (instance package1::NavResponse :init)))

(setf (get package1::NavRequest :md5sum-) "3de51ac40d2fb192c2025702c11f2ede")
(setf (get package1::NavRequest :datatype-) "package1/NavRequest")
(setf (get package1::NavRequest :definition-)
      "int64 x
int64 y
---
int64 p

")

(setf (get package1::NavResponse :md5sum-) "3de51ac40d2fb192c2025702c11f2ede")
(setf (get package1::NavResponse :datatype-) "package1/NavResponse")
(setf (get package1::NavResponse :definition-)
      "int64 x
int64 y
---
int64 p

")



(provide :package1/Nav "3de51ac40d2fb192c2025702c11f2ede")


