#!/usr/bin/env chicken-scheme

(use data-structures sicp test)

(include "raise.scm")

(install-scheme-number-package)
(install-scheme-number-conversion-package)
(install-rational-package)
(install-rational-conversion-package)
(install-complex-package)
(install-complex-conversion-package)

(install-integer-package)
(install-real-package)

(let ((integer (make-integer 1))
      (rational (make-rational 1 1))
      (real (make-real 1))
      (complex (make-complex-from-real-imag 1 0)))
  ;; These tests rely on the fact that we're dealing with lists as a
  ;; convential interface.
  (test rational (raise integer))
  (test real (raise rational))
  (test complex (raise real))
  (test-assert (not (raise complex))))
