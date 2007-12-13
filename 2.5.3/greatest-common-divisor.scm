;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "apply-generic.scm")

(define (greatest-common-divisor x y)
  (apply-generic 'greatest-common-divisor x y))
