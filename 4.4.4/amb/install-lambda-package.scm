;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (install-lambda-package)
  (define (analyze-lambda exp)
    (let ((vars (lambda-parameters exp))
          (bproc (analyze-sequence (lambda-body exp))))
      (lambda (env succeed fail)
        (succeed (make-procedure vars bproc env)
                 fail))))
  (put-amb 'lambda analyze-lambda)
  'done)
