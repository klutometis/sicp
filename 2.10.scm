#!/usr/bin/env chicken-scheme

(use test)

(include "interval.scm")

(define (div-interval x y)
  (if (xor (positive? (upper-bound y))
           (positive? (lower-bound y)))
      (error "It's not clear what it means to divide by an interval that spans zero.")
      (mul-interval
       x
       (make-interval (/ 1.0 (upper-bound y))
                      (/ 1.0 (lower-bound y))))))

(test '(0.0 . 0.0)
      (div-interval (make-interval 0 0) (make-interval 1 1)))

(test-error (div-interval (make-interval 0 0)
                          (make-interval -1 1)))
