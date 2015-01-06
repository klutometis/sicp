#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.60][2\.60:1]]

(use sicp test)

(define set '(2 3 2 1 3 2 2))

(test-assert (element-of-set? 1 set))

(define adjoin-set cons)

(test '(4 2 3 2 1 3 2 2)
      (adjoin-set 4 set))

(define union-set append)

(test '(2 3 2 1 3 2 2 2 3 2 1 3 2 2)
      (union-set set set))

(test '(3 2 2) (intersection-set '(3 2 2) set))

;; 2\.60:1 ends here
