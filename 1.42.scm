#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*1.42][1\.42:1]]

(use test)

(include "compose.scm")

(test 49 ((compose square inc) 6))

;; 1\.42:1 ends here
