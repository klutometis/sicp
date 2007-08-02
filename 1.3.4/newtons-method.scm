(load "newton-transform.scm")
(load "fixed-point.scm")

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))
