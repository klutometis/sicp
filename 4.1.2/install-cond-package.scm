;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "cond->if.scm")

(define (install-cond-package)
  (put 'cond (lambda (exp env) (eval (cond->if exp) env)))
  'done)
