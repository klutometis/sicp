#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.50][3\.50:1]]

(use sicp-streams test)

(include "stream-map.scm")

(let ((iota (stream-enumerate-interval 0 2))
      (kappa (stream-enumerate-interval 2 4)))
  (test '(0 3 8) (stream->list (stream-map * iota kappa))))

;; 3\.50:1 ends here
