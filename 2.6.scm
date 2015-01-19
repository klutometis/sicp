#!/usr/bin/env chicken-scheme

(use sicp test)

(define zero (lambda (f) (lambda (x) x)))

((zero identity) 0)

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(test
 ((one inc) 0)
 (((add-1 zero) inc) 0))

(test
 ((two inc) 0)
 (((add-1 (add-1 zero)) inc) 0))

(define (add m n)
  (lambda (f) (lambda (x) (f ((m (n f)) x)))))

(test 3 (((add one two) inc) 0))
