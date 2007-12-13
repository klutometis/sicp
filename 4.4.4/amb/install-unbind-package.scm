;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (install-unbind-package)
  (define (analyze-unbind exp)
    (lambda (env) (eval-unbind exp env)))
  (put-amb 'unbind! analyze-unbind)
  'done)
