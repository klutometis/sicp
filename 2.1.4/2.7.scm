;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "interval.scm")

(define i (make-interval 0.707 1.0))
(lower-bound i)
(upper-bound i)
