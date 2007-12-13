;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "newton-transform.scm")
(load "fixed-point.scm")

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))
