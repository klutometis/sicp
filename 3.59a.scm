#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.59][3\.59:1]]

(use sicp-streams test)

(include "integrate-series.scm")

(define ones (cons-stream 1 ones))

(test '(1 1/2 1/3 1/4 1/5)
      (stream->list (integrate-series ones) 5))

;; 3\.59:1 ends here
