;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-interval.scm")

(define (make-center-width-interval c w)
  (make-interval (- c w) (+ c w)))
