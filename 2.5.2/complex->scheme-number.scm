(load "apply-generic.scm")

(define (complex->scheme-number z)
  (apply-generic 'complex->scheme-number z))
