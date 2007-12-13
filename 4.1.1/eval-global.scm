;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "the-global-environment.scm")
(load "eval.scm")

(define (eval-global exp)
  (eval exp the-global-environment))
