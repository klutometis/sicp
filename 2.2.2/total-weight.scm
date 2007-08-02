(load "branch-structure.scm")
(load "branch-mobile.scm")

(define (branch-weight branch)
  (let ((structure (branch-structure branch)))
    (if (branch-mobile? structure)
        (total-weight structure)
        structure)))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))
