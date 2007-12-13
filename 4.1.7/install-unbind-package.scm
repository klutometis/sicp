;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "eval-unbind.scm")

(define (install-unbind-package)
  (define (analyze-unbind exp)
    (lambda (env) (eval-unbind exp env)))
  (put 'unbind! analyze-unbind)
  'done)
