#!/usr/bin/env chicken-scheme
(use test)

(define (inc n) (+ n 1))

(define (cube x) (* x x x))

(define (sum-cubes a b)
  (sum cube a inc b))

(define (sum term a next b)
  (let iter ((a a)
             (result 0))
    (if (> a b)
        result
        (iter (next a) (+ result (term a))))))

(test "Iterative sum"
      3025
      (sum-cubes 1 10))
