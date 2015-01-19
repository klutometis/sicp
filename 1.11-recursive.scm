#!/usr/bin/env chicken-scheme

(use test)

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(test "Recursive f" 796 (f 9))
