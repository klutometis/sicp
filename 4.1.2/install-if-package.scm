;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "eval-if.scm")

(define (install-if-package)
  (put 'if (lambda (exp env) (eval-if exp env)))
  'done)
