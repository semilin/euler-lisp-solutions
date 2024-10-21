(in-package :euler)
(declaim (optimize (speed 3)))

(defun multiplep (x upto)
  (t:transduce
   (t:take upto)
   (t:allp (lambda (y) (= 0 (mod x y))))
   (t:ints 1)))

(defun solve ()
  (t:transduce
   (t:filter (lambda (x) (multiplep x 20)))
   #'t:first
   (t:ints 20 :step 2)))
