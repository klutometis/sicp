#!/usr/bin/env chicken-scheme
(use test)

(include "interval.scm")

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

(test '(1 . 1)
      (sub-interval (make-interval 2 2)
                    (make-interval 1 1)))
