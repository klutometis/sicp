;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "install-scheme-number-package.scm")
(load "make-scheme-number.scm")
(load "add.scm")
(load "sub.scm")
(load "mul.scm")
(load "div.scm")

(install-scheme-number-package)
(define n1 (make-scheme-number 2))
(define n2 (make-scheme-number 4))
(add n1 n2)
(sub n1 n2)
(mul n1 n2)
(div n1 n2)
