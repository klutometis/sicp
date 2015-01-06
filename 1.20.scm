#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*1.20][1\.20:1]]

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

;; 1\.20:1 ends here
