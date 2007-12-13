;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (install-if-fail-package)
  (define (analyze-if-fail exp)
    (let ((pproc (analyze (if-predicate exp)))
          (cproc (analyze (if-consequent exp))))
      (lambda (env succeed fail)
        (pproc env
               (lambda (pred-value fail2)
                 (pproc env succeed fail2))
               (lambda ()
                 (cproc env succeed fail))))))
  (put-amb 'if-fail analyze-if-fail)
  'done)
