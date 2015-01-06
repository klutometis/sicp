#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*1.8][1\.8:1]]

(use test)

(define epsilon (make-parameter 0.00001))

(define (square x) (* x x))

(define (good-enough? old-guess guess)
  (< (abs (- old-guess guess)) (epsilon)))

(define (average x y) (/ (+ x y) 2))

(define (improve-square guess x)
  (average guess (/ x guess)))

(define (improve-cube guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (sqrt-iter old-guess guess x improve)
  (if (good-enough? old-guess guess)
      guess
      (sqrt-iter guess (improve guess x) x improve)))

(define (sqrt-newton-delta x) (sqrt-iter 0.0 1.0 x improve-square))

(define (cbrt-newton-delta x) (sqrt-iter 0.0 1.0 x improve-cube))

(test "Delta-based cube-root"
      3.0
      (cbrt-newton-delta 27))

;; 1\.8:1 ends here
