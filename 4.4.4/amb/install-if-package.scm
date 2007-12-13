;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (install-if-package)
  (define (analyze-if exp)
    (let ((pproc (analyze (if-predicate exp)))
          (cproc (analyze (if-consequent exp)))
          (aproc (analyze (if-alternative exp))))
      (lambda (env succeed fail)
        (pproc env
               (lambda (pred-value fail2)
                 (if (true? pred-value)
                     (cproc env succeed fail2)
                     (aproc env succeed fail2)))
               fail))))
  (put-amb 'if analyze-if)
  'done)
