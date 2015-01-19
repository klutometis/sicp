#!/usr/bin/env chicken-scheme

(use test)

(include "fixed-point.scm")

(define dx (make-parameter 0.00001))

(define (deriv g)
  (lambda (x) (/ (- (g (+ x (dx))) (g x)) (dx))))

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (cube x) (* x x x))

(define (square x) (* x x))

(define (cubic a b c)
  (lambda (x) (+ (cube x)
            (* a (square x))
            (* b x)
            c)))

(test 2.0 (newtons-method (cubic 3 -6 -8) 1))
