(ql:quickload :transducers)
(ql:quickload :serapeum)

(defpackage euler
  (:use :cl)
  (:local-nicknames (:t :transducers)
                    (:al :alexandria)
                    (:se :serapeum)))

