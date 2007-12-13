;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "eval-sequence.scm")
(load "begin-actions.scm")

(define (install-begin-package)
  (put 'begin (lambda (exp env) (eval-sequence (begin-actions exp) env)))
  'done)
