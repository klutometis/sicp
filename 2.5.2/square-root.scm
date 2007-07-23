(load "apply-generic.scm")

(define (square-root x)
  (apply-generic 'square-root x))
