;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "let->combination.scm")

(define (install-let-package)
  (put 'let (lambda (exp env) (eval (let->combination exp) env)))
  'done)
