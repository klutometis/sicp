#!/usr/bin/env chicken-scheme

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
