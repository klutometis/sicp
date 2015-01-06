#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.53][3\.53:1]]

(include "stream-map.scm")

(define (add-streams s1 s2) (stream-map + s1 s2))

;; 3\.53:1 ends here
