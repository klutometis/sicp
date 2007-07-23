(load "install-packages.scm")
(load "make-polynomial.scm")
(load "make-rational.scm")
(load "make-term.scm")
(load "add.scm")
(load "apply-generic-raise.scm")

(install-packages)

(define p1 (make-polynomial 'x (list (make-term 2 1) (make-term 0 1))))
(define p2 (make-polynomial 'x (list (make-term 3 1) (make-term 0 1))))
(define rf (make-rational p2 p1))

(add rf rf)
