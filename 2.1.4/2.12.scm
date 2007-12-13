;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "interval.scm")

(define i (make-center-percent-interval 2 .5))
(percent-interval i)
(display i)
