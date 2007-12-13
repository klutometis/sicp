;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "accumulate.scm")

(define (fold-right op init seq)
  (accumulate op init seq))
