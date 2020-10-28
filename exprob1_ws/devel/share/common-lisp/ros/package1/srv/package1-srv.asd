
(cl:in-package :asdf)

(defsystem "package1-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Nav" :depends-on ("_package_Nav"))
    (:file "_package_Nav" :depends-on ("_package"))
  ))