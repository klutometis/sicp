#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.55][3\.55:1]]

(use sicp-streams test)

(include "integers.scm")
(include "partial-sums.scm")

(test '(1 3 6 10 15)
      (stream->list (partial-sums integers) 5))

;; 3\.55:1 ends here
