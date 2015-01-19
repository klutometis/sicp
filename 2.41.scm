#!/usr/bin/env chicken-scheme

(use sicp srfi-1 test)

(include "unique-pairs.scm")

(define (unique-triples n)
  (flatmap
   (lambda (i)
     (map (lambda (j) (cons i j)) (unique-pairs (- i 1))))
   (enumerate-interval 1 n)))

(define (sum-to? s)
  (lambda (triple)
    (= s (apply + triple))))

(define (sum-to-triples n s)
  (filter (sum-to? s) (unique-triples n)))

(test '((5 4 3) (6 4 2) (6 5 1)) (sum-to-triples 6 12))
