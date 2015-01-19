#!/usr/bin/env chicken-scheme

(use sicp test)

(include "union-set.scm")

(define set1 '(1 3 6 10))

(define set2 '(0 2 3 7 12))

(test '(0 1 2 3 6 7 10 12) (union-set set1 set2))
