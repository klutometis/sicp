(load "apply-generic.scm")
(load "get.scm")

(define (numer x)
  (apply-generic 'numer x))
