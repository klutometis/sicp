#!/usr/bin/env chicken-scheme
(use test)

(include "repeated.scm")

(define dx (make-parameter 0.1))

(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x (dx)))
          (f x)
          (f (+ x (dx))))
       3)))

(define (n-fold-smooth f n)
  (repeated (smooth f) n))

(define pi/2 (/ 3.14159265359 2))

(test 0.99667 ((smooth sin) pi/2))
(test 0.83687 ((n-fold-smooth sin 2) pi/2))
