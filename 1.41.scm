#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*1.41][1\.41:1]]

(use test)

(define (inc n) (+ n 1))

(define (double g) (lambda (x) (g (g x))))

(test 21 (((double (double double)) inc) 5))

;; 1\.41:1 ends here
