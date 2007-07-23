(load "apply-generic.scm")
(load "get.scm")

(define (denom x)
  (apply-generic 'denom x))
