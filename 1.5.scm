#!/usr/bin/env chicken-scheme
(use test)

(define (normal-test x y)
  ((if (= (x) 0)
       (lambda () 0)
       y)))

(define (p) (p))

(test 0 (normal-test (lambda () 0) p))
