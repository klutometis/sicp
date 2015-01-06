#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.65][3\.65:1]]

(use sicp sicp-streams test)

(include "partial-sums.scm")
(include "stream-limit.scm")

(define (ln2-summands n)
  (cons-stream (/ 1.0 n)
               (stream-map - (ln2-summands (+ n 1)))))

(define ln2-stream
  (partial-sums (ln2-summands 1)))

(receive (ln2 iterations)
  (stream-limit
   (accelerated-sequence euler-transform ln2-stream) 1e-14)
  (test ln2 (log 2))
  (test 7 iterations))

;; 3\.65:1 ends here
