#!/usr/bin/env chicken-scheme

(use test)

(include "fixed-point.scm")

(test 1.61803 (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.6))
