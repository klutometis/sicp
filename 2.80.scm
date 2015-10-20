#!/usr/bin/env chicken-scheme
(use sicp test)

(include "number-equality.scm")

(define (install-zero-package)
  (install-equality-package)
  (define zero (make-scheme-number 0))
  (put '=zero? '(scheme-number)
       (lambda (x)
         (equ? (tag-scheme-number x) zero)))
  (put '=zero? '(rational)
       (lambda (x)
         (equ? (tag-rational x) zero)))
  (put '=zero? '(complex)
       (lambda (x)
         (equ? (tag-complex x) zero))))

(define (=zero? x)
  (apply-generic '=zero? x))

(install-zero-package)

(let ((scheme-number (make-scheme-number 0))
      (rational (make-rational 0 1))
      (complex (make-complex-from-real-imag 0 0)))
  (test-assert (=zero? scheme-number))
  (test-assert (=zero? rational))
  (test-assert (=zero? complex)))
