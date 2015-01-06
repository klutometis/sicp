#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*1.5][1\.5:1]]

(use test)

(define (normal-test x y)
  ((if (= (x) 0)
       (lambda () 0)
       y)))

(define (p) (p))

(test 0 (normal-test (lambda () 0) p))

;; 1\.5:1 ends here
