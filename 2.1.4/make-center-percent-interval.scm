;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-center-width-interval.scm")

(define (make-center-percent-interval c p)
  (let ((width (* c p)))
    (make-center-width-interval c width)))
