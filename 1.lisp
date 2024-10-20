(defpackage euler
  (:use :cl)
  (:local-nicknames (:t :transducers)))
(in-package :euler)

(defun solve (count)
  (t:transduce
   (t:comp
    (t:take (1- count))
    (t:filter (lambda (x)
                (or (= 0 (mod x 5))
                    (= 0 (mod x 3))))))
   #'+
   (t:ints 1)))
