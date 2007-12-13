;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")

(define (install-require-package)
  (define (require-predicate exp) (cadr exp))
  (define (analyze-require exp)
    (let ((pproc (analyze (require-predicate exp))))
      (lambda (env succeed fail)
        (pproc env
               (lambda (pred-value fail2)
                 (if (not pred-value)
                     (fail2)
                     (succeed 'ok fail2)))
               fail))))
  (put 'require analyze-require)
  'done)
