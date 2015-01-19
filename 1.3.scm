#!/usr/bin/env chicken-scheme

(use data-structures test)

(define (square x x) (* x x))

(define (sum-of-squares x y)
  (+ (square x x) (square y y)))

(define (sum-of-largest-two-squares a b c)
  (apply sum-of-squares (cdr (sort (list a b c) <))))

(test 13 (sum-of-largest-two-squares 1 2 3))
