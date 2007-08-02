(load "branch-length.scm")
(load "branch-weight.scm")

(define (branch-torque branch)
  (let ((length (branch-length branch))
        (weight (branch-weight branch)))
    (* length weight)))
