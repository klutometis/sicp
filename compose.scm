#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*1.42][1\.42:1]]

(define (compose f g) (lambda (x) (f (g x))))

;; 1\.42:1 ends here
