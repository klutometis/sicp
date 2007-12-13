;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "and->if.scm")
(load "analyze.scm")

(define (install-and-package)
  (define (analyze-and exp)
    (analyze (and->if exp)))
  (put 'and analyze-and)
  'done)
