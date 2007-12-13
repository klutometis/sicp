;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (install-let-package)
  (define (analyze-let exp)
    (analyze (let->combination exp)))
  (put-amb 'let analyze-let)
  'done)
