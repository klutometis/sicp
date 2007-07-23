(load "get.scm")
(load "apply-generic.scm")
(load "put-irreducible.scm")

(define (raise x)
  (put-irreducible 'raise)
  (apply-generic 'raise x))
