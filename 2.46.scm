(load "vect.scm")

(define v1 (make-vect 1 2))
(define v2 (make-vect 3 4))
(define scalar 2)

(add-vect v1 v2)
(sub-vect v1 v2)
(scale-vect scalar v1)
