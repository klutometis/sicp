;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (install-variable-package)
  (define (analyze-variable exp)
    (lambda (env succeed fail)
      (succeed (lookup-variable-value exp env)
               fail)))
  (put-amb 'variable analyze-variable)
  'done)
