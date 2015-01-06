#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*1.35][1\.35:1]]

(use test)

(include "fixed-point.scm")

(test 1.61803 (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.6))

;; 1\.35:1 ends here
