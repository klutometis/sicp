#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.12][2\.12:1]]

(use test)

(include "interval-percent.scm")

(let ((i (make-center-percent 6.8 0.1)))
  (test 6.8 (center i))
  (test 0.68 (width i))
  (test 6.12 (lower-bound i))
  (test 7.48 (upper-bound i))
  (test 0.1 (percent i)))

;; 2\.12:1 ends here
