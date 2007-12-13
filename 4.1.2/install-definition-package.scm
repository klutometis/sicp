;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "eval-definition.scm")

(define (install-definition-package)
  (put 'define (lambda (exp env) (eval-definition exp env)))
  'done)
