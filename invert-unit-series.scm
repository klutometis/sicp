#!/usr/bin/env chicken-scheme
(include "mul-series.scm")

(define (invert-unit-series series)
  (cons-stream 1 (stream-map - (mul-series (stream-cdr series)
                                           (invert-unit-series series)))))
