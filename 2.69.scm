#!/usr/bin/env chicken-scheme
(use sicp test)

(include "huffman.scm")

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(test
 '(A C A B B D A)
 (decode sample-message
         (generate-huffman-tree '((A 4) (B 2) (C 1) (D 1)))))
