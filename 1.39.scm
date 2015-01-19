#!/usr/bin/env chicken-scheme

(use test)

(include "cont-frac.scm")

(define pi 3.14159265359)

(define (square x) (* x x))

(define (tan-cf x)
  (cont-frac (lambda (i) (if (zero? i) x (- (square x))))
             (lambda (i) (- (* 2 (+ i 1)) 1))
             3))

(test (tan (/ pi 4)) (tan-cf (/ pi 4)))
