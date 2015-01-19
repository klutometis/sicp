#!/usr/bin/env chicken-scheme

(use sicp-streams test)

(include "partial-sums.scm")

(test '(1 3 6 10 15)
      (stream->list (partial-sums integers) 5))
