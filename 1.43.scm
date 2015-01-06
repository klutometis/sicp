#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*1.43][1\.43:1]]

(use test)

(include "repeated.scm")

(define (square x) (* x x))

(test 625 ((repeated square 2) 5))

;; 1\.43:1 ends here
