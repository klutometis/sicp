#!/usr/bin/env chicken-scheme

(use sicp test)

(define (install-complex-selectors-package)
  (put 'real-part '(complex) real-part)
  (put 'imag-part '(complex) imag-part)
  (put 'magnitude '(complex) magnitude)
  (put 'angle '(complex) angle)
  'done)

(install-scheme-number-package)
(install-rational-package)
(install-complex-package)
(install-complex-selectors-package)

(let ((z (make-complex-from-mag-ang 3 4)))
  (test 3 (magnitude z)))
