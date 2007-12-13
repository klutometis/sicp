;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;; (load "make-interval.scm")
(load "upper-bound.scm")
(load "lower-bound.scm")

(define (width-interval interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2))

;; (width-interval (make-interval 1 2))
