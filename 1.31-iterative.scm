#!/usr/bin/env chicken-scheme
(use test)

(define (inc n) (+ n 1))

(define (product term a next b)
  (let iter ((a a)
             (result 1))
    (if (> a b)
        result
        (iter (next a) (* result (term a))))))

(define (factorial n)
  (product identity 1 inc n))

(test 120 (factorial 5))
