(load "apply-generic.scm")
(load "put-irreducible.scm")

(define (=zero? x)
  (put-irreducible '=zero?)
  (apply-generic '=zero? x))
