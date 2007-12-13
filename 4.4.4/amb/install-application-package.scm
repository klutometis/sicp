;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (install-application-package)
  (define (analyze-application exp)
    (let ((fproc (analyze (operator exp)))
          (aprocs (map analyze (operands exp))))
      (lambda (env succeed fail)
        (fproc env
               (lambda (proc fail2)
                 (get-args aprocs
                           env
                           (lambda (args fail3)
                             (execute-application
                              proc args succeed fail3))
                           fail2))
               fail))))
  (define (get-args aprocs env succeed fail)
    (if (null? aprocs)
        (succeed '() fail)
        ((car aprocs) env
         (lambda (arg fail2)
           (get-args (cdr aprocs)
                     env
                     (lambda (args fail3)
                       (succeed (cons arg args)
                                fail3))
                     fail2))
         fail)))
  (define (execute-application proc args succeed fail)
    (cond ((primitive-procedure? proc)
           (succeed (apply-primitive-procedure proc args)
                    fail))
          ((compound-procedure? proc)
           ((procedure-body proc)
            (extend-environment (procedure-parameters proc)
                                args
                                (procedure-environment proc))
            succeed
            fail))
          (else
           (error
            "Unknown procedure type -- EXECUTE-APPLICATION"
            proc))))
  (put-amb 'application analyze-application)
  'done)
