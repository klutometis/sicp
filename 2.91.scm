#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.91][2\.91:1]]

(use sicp test)

(include "polynomial.scm")
(include "polynomial-sub.scm")
(include "polynomial-div.scm")

(install-scheme-number-package)
(install-rational-package)
(install-complex-package)
(install-negation-package)
(install-polynomial-package)
(install-polynomial-sub-package)
(install-polynomial-div-package)
(install-zero-package)

(let ((p1 (make-polynomial 'x '((5 1) (0 -1))))
      (p2 (make-polynomial 'x '((2 1) (0 -1)))))
  (test '((polynomial x (3 1) (1 1)) (polynomial x (1 1) (0 -1)))
        (div p1 p2)))

;; 2\.91:1 ends here
