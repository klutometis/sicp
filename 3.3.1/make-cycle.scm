;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "last-pair.scm")

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)
