(load "apply-generic.scm")
(load "get.scm")

(define (imag-part z) (apply-generic 'imag-part z))
