#!/usr/bin/env chicken-scheme
(use sicp)

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? (square guess) x)
      guess
      (sqrt-iter (improve guess x) x)))

(define sqrt-newton
  (case-lambda
   ((x) (sqrt-newton sqrt-iter x))
   ((sqrt-iter x) (sqrt-iter 1.0 x))))
