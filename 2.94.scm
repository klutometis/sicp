#!/usr/bin/env chicken-scheme
(use sicp test)

(include "polynomial.scm")
(include "polynomial-sub.scm")
(include "polynomial-div.scm")
(include "rational-generic.scm")
(include "greatest-common-divisor.scm")

(install-scheme-number-package)
(install-rational-package)
(install-rational-simplifying-make-package)
(install-complex-package)
(install-negation-package)
(install-polynomial-package)
(install-polynomial-sub-package)
(install-polynomial-div-package)
(install-zero-package)
(install-greatest-common-divisor-package)

(let ((p1 (make-polynomial 'x '((4 1) (3 -1) (2 -2) (1 2))))
      (p2 (make-polynomial 'x '((3 1) (1 -1)))))
  (test '(polynomial x (2 -1) (1 1))
        (greatest-common-divisor p1 p2)))
