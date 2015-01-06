#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*1.34][1\.34:1]]

(use test)

(define (f g) (g 2))

(test-error (f f))

;; 1\.34:1 ends here
