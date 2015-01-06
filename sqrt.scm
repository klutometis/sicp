#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*1.6][1\.6:1]]

(use sicp)

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? (square guess) x)
      guess
      (sqrt-iter (improve guess x) x)))

(define sqrt-newton
  (case-lambda
   ((x) (sqrt-newton sqrt-iter x))
   ((sqrt-iter x) (sqrt-iter 1.0 x))))

;; 1\.6:1 ends here
