#!/usr/bin/env chicken-scheme
(include "compose.scm")

(define (repeated f n)
  (if (zero? n)
      identity
      (compose f (repeated f (- n 1)))))
