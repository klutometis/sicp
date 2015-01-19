#!/usr/bin/env chicken-scheme

(use data-structures sicp srfi-69 test)

(include "raise.scm")
(include "apply-generic-raise.scm")

(install-scheme-number-package)
(install-scheme-number-conversion-package)
(install-rational-package)
(install-rational-conversion-package)
(install-complex-package)
(install-complex-conversion-package)

(install-integer-package)
(install-real-package)

(let ((rational (make-rational 1 1))
      (complex (make-complex-from-real-imag 1 0)))
  (test '(complex rectangular 2 . 0) (add rational complex))
  (test 0 (imag-part rational)))
