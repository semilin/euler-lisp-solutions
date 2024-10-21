(in-package :euler)
(declaim (optimize (speed 3)))

(defun square (x)
  (expt x 2))

(defun sum-squares (upto)
  (t:transduce
   (t:comp
    (t:take upto)
    (t:map #'square))
   #'+
   (t:ints 1)))

(defun square-sum (upto)
  (square
   (t:transduce
    (t:take upto)
    #'+
    (t:ints 1))))

(defun solve ()
  (- (square-sum 100) (sum-squares 100)))
