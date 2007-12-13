;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "branch-length.scm")
(load "branch-weight.scm")

(define (branch-torque branch)
  (let ((length (branch-length branch))
        (weight (branch-weight branch)))
    (* length weight)))
