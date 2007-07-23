(load "apply-generic.scm")

(define (greatest-common-divisor x y)
  (apply-generic 'greatest-common-divisor x y))
