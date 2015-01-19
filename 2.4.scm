#!/usr/bin/env chicken-scheme

(use test)

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(let ((pair (cons 1 2)))
  (test 1 (car pair))
  (test 2 (cdr pair)))
