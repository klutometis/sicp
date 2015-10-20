#!/usr/bin/env chicken-scheme
(use sicp-streams test)

(include "stream-map.scm")

(let ((iota (stream-enumerate-interval 0 2))
      (kappa (stream-enumerate-interval 2 4)))
  (test '(0 3 8) (stream->list (stream-map * iota kappa))))
