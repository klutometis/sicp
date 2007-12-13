;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "make-procedure.scm")
(load "analyze-sequence.scm")
(load "lambda-parameters.scm")
(load "lambda-body.scm")

(define (install-lambda-package)
  (define (analyze-lambda exp)
    (let ((vars (lambda-parameters exp))
          (bproc (analyze-sequence (lambda-body exp))))
      (lambda (env succeed fail)
        (succeed (make-procedure vars bproc env)
                 fail))))
  (put 'lambda analyze-lambda)
  'done)
