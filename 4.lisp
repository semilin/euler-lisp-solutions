(in-package :euler)
(declaim (optimize (speed 3)))

(defun palindromep (s)
  (string-equal s (reverse s)))

(defun solve ()
  (t:transduce
   (t:comp
    (t:map (lambda (x) (apply #'* x)))
    (t:filter-map (lambda (x)
                    (and (se:~> x write-to-string palindromep) x))))
   (t:fold #'max)
   (let ((range (coerce (se:range 100 999) 'list)))
     (al:map-product #'list range range))))

