;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "lower-bound.scm")
(load "upper-bound.scm")

(define (center-interval i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
