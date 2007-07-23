(load "apply-generic.scm")

(define (square x)
  (apply-generic 'square x))
