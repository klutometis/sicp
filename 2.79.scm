#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.79][2\.79:1]]

(use sicp test)

(include "number-equality.scm")

(install-equality-package)

(let ((scheme-number (make-scheme-number 0.5))
      (rational (make-rational 2 4))
      (complex (make-complex-from-real-imag 0.5 0)))
  (test-assert (equ? scheme-number scheme-number))
  (test-assert (equ? scheme-number rational))
  (test-assert (equ? scheme-number complex))

  (test-assert (equ? rational scheme-number))
  (test-assert (equ? rational rational))
  (test-assert (equ? rational complex))

  (test-assert (equ? complex scheme-number))
  (test-assert (equ? complex rational))
  (test-assert (equ? complex complex)))

;; 2\.79:1 ends here
