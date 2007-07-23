(load "apply-generic.scm")

(define (add x y) (apply-generic 'add x y))
