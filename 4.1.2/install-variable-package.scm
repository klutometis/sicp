;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "lookup-variable-value.scm")

(define (install-variable-package)
  (put 'variable (lambda (exp env) (lookup-variable-value exp env)))
  'done)
