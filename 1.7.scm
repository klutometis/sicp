#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*1.7][1\.7:1]]

(use test)

(define epsilon (make-parameter 0.00001))

(define (square x) (* x x))

(define (good-enough? old-guess guess)
  (< (abs (- old-guess guess)) (epsilon)))

(define (average x y) (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter old-guess guess x)
  (if (good-enough? old-guess guess)
      guess
      (sqrt-iter guess (improve guess x) x)))

(define (sqrt-newton-delta x) (sqrt-iter 0.0 1.0 x))

(test "Square-root with delta-based `good-enough?'"
      3.0
      (sqrt-newton-delta 9))

(test
 "Square-root-Newton-delta is pretty good."
 (sqrt 0.00001)
 (sqrt-newton-delta 0.00001))

;; 1\.7:1 ends here
