#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.54][3\.54:1]]

(use sicp-streams test)

(include "stream-map.scm")
(include "integers.scm")

(define (mul-streams s1 s2) (stream-map * s1 s2))

(define factorial
  (cons-stream 1 (mul-streams factorial integers)))

(test '(1 1 2 6 24 120) (stream->list factorial 6))

;; 3\.54:1 ends here
