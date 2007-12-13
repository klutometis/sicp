;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-segment.scm")
(load "midpoint-segment.scm")
(load "print-point.scm")
(load "make-point.scm")

(define segment (make-segment (make-point 0 0)
                                (make-point 4 4)))

                
(print-point (midpoint-segment segment))
