#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.87][2\.87:1]]

(use sicp test)

(include "polynomial.scm")

(install-scheme-number-package)
(install-rational-package)
(install-complex-package)
(install-polynomial-package)
(install-zero-package)

(let* ((p1 (make-polynomial 'x '((2 1))))
       (p2 (make-polynomial 'x `((2 ,p1)))))
  (test '(polynomial x (2 (polynomial x (2 2))))
        (add p2 p2)))

;; 2\.87:1 ends here
