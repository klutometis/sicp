(load "interval.scm")

(define minuend (make-interval -1.0 0.5))
(define subtrahend (make-interval -3.0 -2.0))
(sub-interval minuend subtrahend)
