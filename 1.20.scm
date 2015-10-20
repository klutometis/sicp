#!/usr/bin/env chicken-scheme
(define count (make-parameter 0))

(define (remainder-count a b)
  (count (+ (count) 1))
  (remainder a b))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder-count a b))))

(parameterize ((count 0))
  (gcd 206 40)
  (test 4 (count)))
