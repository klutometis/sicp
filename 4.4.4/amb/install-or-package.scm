;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (install-or-package)
  (define (analyze-or exp)
    (analyze (or->if exp)))
  (put-amb 'or analyze-or)
  'done)
