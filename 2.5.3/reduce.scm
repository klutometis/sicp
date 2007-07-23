(load "apply-generic.scm")

(define (reduce x y) (apply-generic 'reduce x y))
