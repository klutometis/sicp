#!/usr/bin/env chicken-scheme

(use test)

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(test 1024 (A 1 10))
(test 65536 (A 2 4))
(test 65536 (A 3 3))

(define (f n) (A 0 n))
(define (f-prime n) (* 2 n))

(define (g n) (A 1 n))
(define (g-prime n)
   (expt 2 n))

 (define (h n) (A 2 n))
 (define (h-prime n)
   (if (= n 1)
       2
       (expt 2 (h-prime (- n 1)))))

 (test "f(n) = f'(n)" (f 10) (f-prime 10))
 (test "g(n) = g'(n)" (g 10) (g-prime 10))
 (test "h(n) = h'(n)" (h 4) (h-prime 4))
