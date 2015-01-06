#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*1.11][1\.11:1]]

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

;; 1\.11:1 ends here
