#!/usr/bin/env chicken-scheme
(use test)

(include "filtered-accumulate.scm")

(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (fermat-test n)
     (define (try-it a)
       (= (expmod a n n) a))
     (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (sum-primes a b)
  (filtered-accumulate (cute fast-prime? <> 100)
                       +
                       0
                       identity
                       a
                       add1
                       b))

(test 17 (sum-primes 2 10))
