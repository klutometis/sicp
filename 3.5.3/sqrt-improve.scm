(load "average.scm")

(define (sqrt-improve guess x)
  (average guess (/ x guess)))
