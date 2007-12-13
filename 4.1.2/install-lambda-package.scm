;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "make-procedure.scm")
(load "lambda-parameters.scm")
(load "lambda-body.scm")

(define (install-lambda-package)
  (put 'lambda
       (lambda (exp env)
         (make-procedure (lambda-parameters exp)
                         (lambda-body exp)
                         env)))
  'done)
