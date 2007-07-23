(load "apply-generic.scm")

(define (equ? x y) (apply-generic 'equ? x y))
