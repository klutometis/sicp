#!/usr/bin/env chicken-scheme

(use test)

(define (f g) (g 2))

(test-error (f f))
