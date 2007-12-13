;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (install-cond-package)
  (define (analyze-cond exp)
    (analyze (cond->if exp)))
  (put-amb 'cond analyze-cond)
  'done)
