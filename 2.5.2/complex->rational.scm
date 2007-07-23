(load "apply-generic.scm")

(define (complex->rational z)
  (apply-generic 'complex->rational z))
