#!/usr/bin/env chicken-scheme
(use sicp test)

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define list '(1 2 3))

(test '(1 4 9) (map square list))

(define (append seq1 seq2)
  (accumulate cons seq1 seq2))

(test '(1 2 3 1 2 3) (append list list))

(define (length sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))

(test 3 (length list))
