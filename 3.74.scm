#!/usr/bin/env chicken-scheme
(use sicp-streams test)

(include "stream-map.scm")

(define (sign-change-detector x y)
  (cond ((or (zero? x)
             (zero? y)
             (= (signum x) (signum y))) 0)
        ((positive? y) 1)
        (else -1)))

(define sense-data
  (list->stream '(1 2 1.5 1 0.5 -0.1 -2 -3 -2 -0.5 0.2 3 4)))

(define zero-crossings
  (stream-map sign-change-detector sense-data (stream-cdr sense-data)))

(test '(0 0 0 0 -1 0 0 0 0 1 0 0) (stream->list zero-crossings))
