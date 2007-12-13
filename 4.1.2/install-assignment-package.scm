;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "eval-assignment.scm")

(define (install-assignment-package)
  (put 'set! (lambda (exp env) (eval-assignment exp env)))
  'done)

