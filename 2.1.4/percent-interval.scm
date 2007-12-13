;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "center-interval.scm")
(load "width-interval.scm")

(define (percent-interval i)
  (abs (/ (width-interval i) (center-interval i))))

