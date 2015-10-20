#!/usr/bin/env chicken-scheme
(use test)

(define (f n)
  (f-iter 2 1 0 (- n 2)))

(define (f-iter a b c n)
  (if (zero? n)
      a
      (f-iter (+ a (* 2 b) (* 3 c))
              a
              b
              (- n 1))))

(test "Iterative f" 796 (f 9))
