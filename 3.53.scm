#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.53][3\.53:1]]

(use debug sicp-streams test)

(include "add-streams.scm")

(define s (cons-stream 1 (add-streams s s)))

(test '(1 2 4 8) (stream->list s 4))

;; 3\.53:1 ends here
