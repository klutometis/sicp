;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "eval-global.scm")
(load "install-packages.scm")
(load "list-operations.scm")
(load "install-lazy-quoted-package.scm")

(install-packages)
(install-lazy-quoted-package)
(map eval-global list-operations)

(define lazy-list-test (eval-global '(+ 0 (car '(1 2 3)))))

(test
 "lazy list"
 1
 lazy-list-test
 '= =)
