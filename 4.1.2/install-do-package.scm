;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "eval-do.scm")

(define (install-do-package)
  (put 'do (lambda (exp env) (eval-do exp env)))
  'done)
