;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "x-point.scm")
(load "y-point.scm")

(define (distance-points p1 p2)
  (sqrt (+
         (square (- (x-point p2) (x-point p1)))
         (square (- (y-point p2) (y-point p1))))))
