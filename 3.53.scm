#!/usr/bin/env chicken-scheme
(use sicp-streams test)

(include "add-streams.scm")

(define s (cons-stream 1 (add-streams s s)))

(test '(1 2 4 8) (stream->list s 4))
