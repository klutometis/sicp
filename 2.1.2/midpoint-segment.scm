;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-point.scm")
(load "x-point.scm")
(load "y-point.scm")
(load "start-segment.scm")
(load "end-segment.scm")
(load "average.scm")

(define (midpoint-segment segment)
  (let ((incipiens (start-segment segment))
        (terminans (end-segment segment)))
    (make-point (average (x-point incipiens) (x-point terminans))
                (average (y-point incipiens) (y-point terminans)))))
