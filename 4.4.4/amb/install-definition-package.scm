;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (install-definition-package)
  (define (analyze-definition exp)
    (let ((var (definition-variable exp))
          (vproc (analyze (definition-value exp))))
      (lambda (env succeed fail)
        (vproc env                        
               (lambda (val fail2)
                 (define-variable! var val env)
                 (succeed 'ok fail2))
               fail))))
  (put-amb 'define analyze-definition)
  'done)
