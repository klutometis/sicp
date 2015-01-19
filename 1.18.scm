#!/usr/bin/env chicken-scheme

(use test)

(define (double n) (* n 2))
    
(define (halve n) (/ n 2))

(define (fast-* a b)
  (fast-*-iter a b 0))

(define (fast-*-iter a b c)
  (cond ((= b 0) c)
        ((even? b) (fast-*-iter (double a) (halve b) c))
        (else (fast-*-iter a (- b 1) (+ c a)))))

(test 20 (fast-* 4 5))
(test 56 (fast-* 7 8))
