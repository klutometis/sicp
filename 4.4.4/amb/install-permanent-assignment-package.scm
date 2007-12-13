;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (install-permanent-assignment-package)
  (define (analyze-assignment exp)
    (let ((var (assignment-variable exp))
          (vproc (analyze (assignment-value exp))))
      (lambda (env succeed fail)
        (vproc env
               (lambda (val fail)
                 (set-variable-value! var val env)
                 (succeed 'ok fail))
               fail))))
  (put-amb 'permanent-set! analyze-assignment)
  'done)
