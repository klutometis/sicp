;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "or->if.scm")

(define (install-or-package)
  (put 'or (lambda (exp env) (eval (or->if exp) env)))
  'done)
