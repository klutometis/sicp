;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "exponent.scm")
(load "base.scm")
(load "make-exponentiation.scm")

(define (install-exponent-package)
  (define (deriv-** exp var)
    (make-exponentiation (base exp) (exponent exp)))
  (put 'deriv '** deriv-**)
  'done)
