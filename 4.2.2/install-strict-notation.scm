;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "actual-value.scm")

(define (install-strict-notation)
  (put 'strict actual-value)
  'done)
