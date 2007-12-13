;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "match?.scm")
(load "eval-global.scm")
(load "install-packages.scm")
(load "list-operations.scm")
(load "integral.scm")
(load "install-lazy-quoted-package.scm")
(load "install-lazy-cons-package.scm")
(load "user-print.scm")

(install-packages)
(install-lazy-quoted-package)
(install-lazy-cons-package)
(map eval-global list-operations)
(map eval-global integral)

(define infinite-lazy-list
  (with-output-to-string
    (lambda () (user-print (eval-global 'ones)))))

(define finite-lazy-list
  (with-output-to-string
    (lambda () (user-print (eval-global '(quote (1 2 3)))))))

(test
 "printing lazy list"
 "(1 2 3)"
 finite-lazy-list
 'match? match?)

(test
 "printing infinite lazy list (stops at 10)"
 "(1 1 1 1 1 1 1 1 1 1 ...)"
 infinite-lazy-list
 'match? match?)
