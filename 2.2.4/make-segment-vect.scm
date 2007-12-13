;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-vect.scm")

(define (make-segment start-x start-y end-x end-y)
  (list (make-vect start-x start-y) (make-vect end-x end-y)))
