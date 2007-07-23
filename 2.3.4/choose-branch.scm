(load "left-branch.scm")
(load "right-branch.scm")

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (eror "bad bit -- CHOOSE-BRANCH " bit))))

