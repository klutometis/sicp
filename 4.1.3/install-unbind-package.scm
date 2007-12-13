;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "eval-unbind.scm")

(define (install-unbind-package)
  (put 'unbind! (lambda (exp env) (eval-unbind exp env)))
  'done)
