(load "left-branch.scm")
(load "right-branch.scm")
(load "branch-mobile.scm")
(load "branch-torque.scm")

(define (mobile-balanced? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    ;; Don't fall through on or.
    (and (or (not (branch-mobile? left)) (delay (mobile-balanced? left)))
         (or (not (branch-mobile? right)) (delay (mobile-balanced? right)))
         (= (branch-torque left) (branch-torque right)))))
