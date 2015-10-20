#!/usr/bin/env chicken-scheme
(use sicp-streams test)

(define (expand num den radix)
  (cons-stream
   (quotient (* num radix) den)
   (expand (remainder (* num radix) den) den radix)))

(test '(1 4 2 8 5 7 1 4 2 8 5 7)
      (stream->list (expand 1 7 10) 12))
(test '(3 7 5 0 0 0 0)
      (stream->list (expand 3 8 10) 7))
