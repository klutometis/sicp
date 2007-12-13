;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "or->if.scm")
(load "analyze.scm")

(define (install-or-package)
  (define (analyze-or exp)
    (analyze (or->if exp)))
  (put 'or analyze-or)
  'done)
