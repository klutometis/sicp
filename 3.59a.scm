#!/usr/bin/env chicken-scheme
(use sicp-streams test)

(include "integrate-series.scm")

(define ones (cons-stream 1 ones))

(test '(1 1/2 1/3 1/4 1/5)
      (stream->list (integrate-series ones) 5))
