(load "apply-generic.scm")

(define (sub x y) (apply-generic 'sub x y))
