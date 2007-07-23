(load "div-interval.scm")
(load "mul-interval.scm")
(load "add-interval.scm")

(define (par1-interval r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
