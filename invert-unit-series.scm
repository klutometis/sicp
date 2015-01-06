#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.61][3\.61:1]]

(include "mul-series.scm")

(define (invert-unit-series series)
  (cons-stream 1 (stream-map - (mul-series (stream-cdr series)
                                           (invert-unit-series series)))))

;; 3\.61:1 ends here
