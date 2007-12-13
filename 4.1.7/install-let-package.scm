;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "let->combination.scm")
(load "analyze.scm")

(define (install-let-package)
  (define (analyze-let exp)
    (analyze (let->combination exp)))
  (put 'let analyze-let)
  'done)
