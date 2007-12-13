;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (install-letrec-package)
  (define (analyze-letrec exp)
    (analyze (letrec->let exp)))
  (put-amb 'letrec analyze-letrec)
  'done)
