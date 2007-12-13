;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "let*->nested-lets.scm")

(define (install-let*-package)
  (put 'let* (lambda (exp env) (eval (let*->nested-lets exp) env)))
  'done)
