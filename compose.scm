#!/usr/bin/env chicken-scheme

(define (compose f g) (lambda (x) (f (g x))))
