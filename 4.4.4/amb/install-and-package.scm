;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (install-and-package)
  (define (analyze-and exp)
    (analyze (and->if exp)))
  (put-amb 'and analyze-and)
  'done)
