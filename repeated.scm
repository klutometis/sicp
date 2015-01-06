#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*1.43][1\.43:1]]

(include "compose.scm")

(define (repeated f n)
  (if (zero? n)
      identity
      (compose f (repeated f (- n 1)))))

;; 1\.43:1 ends here
