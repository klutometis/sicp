#!/usr/bin/env chicken-scheme
(use test)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (sum-coprimes n)
  (filtered-accumulate (lambda (i) (= (gcd i n) 1))
                       +
                       0
                       identity
                       0
                       add1
                       (- n 1)))

(test 20 (sum-coprimes 10))
