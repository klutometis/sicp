(load "last-exp?.scm")
(load "first-exp.scm")
(load "make-begin.scm")

(define (sequence->exp seq)
  (cond ((null? seq) seq)
        ((last-exp? seq) (first-exp seq))
        (else (make-begin seq))))
