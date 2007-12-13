;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "install-packages.scm")
(load "make-dense-polynomial.scm")
(load "add.scm")
(load "sub.scm")
(load "mul.scm")
(load "apply-generic-raise.scm")

(install-packages)
(define augend (make-dense-polynomial 'x '(1 1)))
(define addend (make-dense-polynomial 'x '(1 1)))

(add augend addend)
(sub augend addend)
(mul augend addend)
