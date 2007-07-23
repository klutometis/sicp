(load "apply-generic.scm")
(load "get.scm")

(define (real-part z) (apply-generic 'real-part z))
