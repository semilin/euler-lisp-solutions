(in-package :euler)
(declaim (optimize (speed 3)))

(defun odd-half (x)
  (let ((half (floor (/ x 2))))
    (if (= 0 (mod half 2))
        (1- half)
        half)))

(defun is-prime (x)
  (if (= 0 (mod x 2))
      nil
      (t:transduce
       (t:comp
        (t:take-while (lambda (y) (> y 1))))
       (t:allp (lambda (y)
                 (/= 0 (mod x y))))
       (t:ints (odd-half x) :step -2))))

(defun largest-prime-factor (x)
  (t:transduce
   (t:comp (t:take-while (lambda (y) (> y 1)))
           (t:filter (lambda (y) (and (= 0 (mod x y))
                                 (is-prime y)))))
   #'t:first
   (t:ints (odd-half x)
           :step -2)))

;; this took 47 minutes, so mayyybe some room for optimization
(defun solve ()
  (largest-prime-factor 600851475143))
