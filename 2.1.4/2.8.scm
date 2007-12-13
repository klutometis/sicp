;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "interval.scm")

(define minuend (make-interval -1.0 0.5))
(define subtrahend (make-interval -3.0 -2.0))
(sub-interval minuend subtrahend)
