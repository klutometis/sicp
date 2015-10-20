#!/usr/bin/env chicken-scheme
(use sicp test)

(include "polynomial.scm")
(include "polynomial-sub.scm")

(install-scheme-number-package)
(install-rational-package)
(install-complex-package)
(install-polynomial-package)
(install-negation-package)
(install-polynomial-sub-package)

(let* ((p1 (make-polynomial 'x '((2 1))))
       (p2 (make-polynomial 'x `((2 ,p1)))))
  (test '(polynomial x)
        (sub p2 p2)))
