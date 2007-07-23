(load "install-packages.scm")
(load "greatest-common-divisor.scm")
(load "make-polynomial.scm")
(load "equ?.scm")
(load "apply-generic-raise.scm")

(install-packages)

(define p1 (make-polynomial 'x '((4 1) (3 -1) (2 -2) (1 2))))
(define p2 (make-polynomial 'x '((3 1) (1 -1))))
(define solution (make-polynomial 'x '((2 -1) (1 1))))
(equ? (greatest-common-divisor p1 p2) solution)
