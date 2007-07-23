(load "apply-generic.scm")
(load "put-irreducible.scm")

(define (equ? x y)
  (put-irreducible 'equ?)
  (apply-generic 'equ? x y))
