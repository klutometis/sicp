#!/usr/bin/env chicken-scheme
(use test)

(include "repeated.scm")

(define (square x) (* x x))

(test 625 ((repeated square 2) 5))
