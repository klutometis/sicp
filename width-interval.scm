;; (load "make-interval.scm")
(load "upper-bound.scm")
(load "lower-bound.scm")

(define (width-interval interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2))

;; (width-interval (make-interval 1 2))
