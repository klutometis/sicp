#!/usr/bin/env chicken-scheme

(use sicp-streams test)

(include "mul-series.scm")
(include "invert-unit-series.scm")
(include "trig-series.scm")

(define (div-series s1 s2)
  (if (zero? (stream-car s2))
      (error "Division by zero: DIV-SERIES")
      (mul-series s1 (invert-unit-series s2))))

(define tan-series (div-series sine-series cosine-series))

(parameterize ((current-test-epsilon 0.001))
  (test
   (tan 1)
   (apply + (stream->list tan-series 16))))
