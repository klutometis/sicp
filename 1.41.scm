#!/usr/bin/env chicken-scheme
(use test)

(define (inc n) (+ n 1))

(define (double g) (lambda (x) (g (g x))))

(test 21 (((double (double double)) inc) 5))
