
(cl:in-package :asdf)

(defsystem "package1-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "NewPosition" :depends-on ("_package_NewPosition"))
    (:file "_package_NewPosition" :depends-on ("_package"))
    (:file "Position" :depends-on ("_package_Position"))
    (:file "_package_Position" :depends-on ("_package"))
  ))