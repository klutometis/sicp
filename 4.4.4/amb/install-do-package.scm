;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (install-do-package)
  (define (analyze-do exp)
    (lambda (env) (eval-do exp env)))
  (put-amb 'do analyze-do)
  'done)
