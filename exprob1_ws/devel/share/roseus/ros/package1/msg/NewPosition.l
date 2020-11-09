;; Auto-generated. Do not edit!


(when (boundp 'package1::NewPosition)
  (if (not (find-package "PACKAGE1"))
    (make-package "PACKAGE1"))
  (shadow 'NewPosition (find-package "PACKAGE1")))
(unless (find-package "PACKAGE1::NEWPOSITION")
  (make-package "PACKAGE1::NEWPOSITION"))

(in-package "ROS")
;;//! \htmlinclude NewPosition.msg.html


(defclass package1::NewPosition
  :super ros::object
  :slots (_nx _ny ))

(defmethod package1::NewPosition
  (:init
   (&key
    ((:nx __nx) 0)
    ((:ny __ny) 0)
    )
   (send-super :init)
   (setq _nx (round __nx))
   (setq _ny (round __ny))
   self)
  (:nx
   (&optional __nx)
   (if __nx (setq _nx __nx)) _nx)
  (:ny
   (&optional __ny)
   (if __ny (setq _ny __ny)) _ny)
  (:serialization-length
   ()
   (+
    ;; int64 _nx
    8
    ;; int64 _ny
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _nx
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _nx (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _nx) (= (length (_nx . bv)) 2)) ;; bignum
              (write-long (ash (elt (_nx . bv) 0) 0) s)
              (write-long (ash (elt (_nx . bv) 1) -1) s))
             ((and (class _nx) (= (length (_nx . bv)) 1)) ;; big1
              (write-long (elt (_nx . bv) 0) s)
              (write-long (if (>= _nx 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _nx s)(write-long (if (>= _nx 0) 0 #xffffffff) s)))
     ;; int64 _ny
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _ny (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _ny) (= (length (_ny . bv)) 2)) ;; bignum
              (write-long (ash (elt (_ny . bv) 0) 0) s)
              (write-long (ash (elt (_ny . bv) 1) -1) s))
             ((and (class _ny) (= (length (_ny . bv)) 1)) ;; big1
              (write-long (elt (_ny . bv) 0) s)
              (write-long (if (>= _ny 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _ny s)(write-long (if (>= _ny 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _nx
#+(or :alpha :irix6 :x86_64)
      (setf _nx (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _nx (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _ny
#+(or :alpha :irix6 :x86_64)
      (setf _ny (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _ny (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(setf (get package1::NewPosition :md5sum-) "865ef1ea904ca728a90504003d8b9fb0")
(setf (get package1::NewPosition :datatype-) "package1/NewPosition")
(setf (get package1::NewPosition :definition-)
      "int64 nx
int64 ny

")



(provide :package1/NewPosition "865ef1ea904ca728a90504003d8b9fb0")


