(load "lower-bound.scm")
(load "upper-bound.scm")

(define (center-interval i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
