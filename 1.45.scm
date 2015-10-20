#!/usr/bin/env chicken-scheme
(use test)

(include "fixed-point.scm")
(include "repeated.scm")

(define (average x y) (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (sqrt x)
  (fixed-point-of-transform
   (lambda (y) (/ x y))
   average-damp
   1.0))

(define (nth-root x n)
  (fixed-point-of-transform
   (lambda (y) (/ x (expt y (- n 1))))
   (repeated average-damp (floor (/ (log n) (log 2))))
   1.0))

(test 2.0 (nth-root 16 4))
(test 2.0 (nth-root 32 5))
(test 2.0 (nth-root 64 6))
(test 2.0 (nth-root 128 7))
(test 2.0 (nth-root 256 8))
(test 2.0 (nth-root 65536 16))
