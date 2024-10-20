(in-package :euler)

(defun fib (x l)
  (if (> x (length l))
      (fib x
           (cons (+ (cond ((= 0 (length l)) 1)
                          (t (car l)))
                    (cond ((= 0 (length l)) 0)
                          ((= 1 (length l)) 1)
                          (t (cadr l))))
                 l))
      l))

(defun solve ()
  (t:transduce
   (t:comp
    (t:filter (lambda (x) (and (evenp x)
                               (> 4000000 x)))))
   #'+
   (fib 500 nil)))
