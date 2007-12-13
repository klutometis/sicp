;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "center-interval.scm")
(load "percent-interval.scm")

(define (print-center-percent-interval i)
  (display (cons (center-interval i) (percent-interval i))))
