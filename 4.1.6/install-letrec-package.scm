;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "letrec->let.scm")

(define (install-letrec-package)
  (put 'letrec (lambda (exp env) (eval (letrec->let exp) env)))
  'done)
