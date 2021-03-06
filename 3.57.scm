#!/usr/bin/env chicken-scheme
(use sicp-streams test)

(include "stream-map.scm")

(define additions (make-parameter 0))

(define (add x y) (additions (+ (additions) 1))
  (+ x y))

(define (add-streams s1 s2) (stream-map add s1 s2))

(define fibs
  (cons-stream
   0
   (cons-stream 1 (add-streams (stream-cdr fibs) fibs))))

(stream->list fibs 10)

(test 9 (additions))
