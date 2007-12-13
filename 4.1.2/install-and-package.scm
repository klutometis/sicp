;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "and->if.scm")

(define (install-and-package)
  (put 'and (lambda (exp env) (eval (and->if exp) env)))
  'done)
