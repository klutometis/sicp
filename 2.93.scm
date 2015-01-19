#!/usr/bin/env chicken-scheme

(use debug sicp test)

(include "polynomial.scm")
(include "polynomial-sub.scm")
(include "polynomial-div.scm")
(include "rational-generic.scm")

(install-scheme-number-package)
(install-rational-package)
(install-complex-package)
(install-negation-package)
(install-polynomial-package)
(install-polynomial-sub-package)
(install-polynomial-div-package)
(install-zero-package)

(let ((p1 (make-polynomial 'x '((2 1) (0 1))))
      (p2 (make-polynomial 'x '((3 1) (0 1)))))
  (let ((rf (make-rational p2 p1)))
    (test '(rational (polynomial x (5 2) (3 2) (2 2) (0 2))
                     polynomial x (4 1) (2 2) (0 1))
          (add rf rf))))
