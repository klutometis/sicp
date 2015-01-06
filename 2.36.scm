#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.36][2\.36:1]]

(use sicp test)

(include "accumulate-n.scm")

(define s '((1 2 3) (4 5 6) (7 8 9) (10 11 12)))

(test '(22 26 30) (accumulate-n + 0 s))

;; 2\.36:1 ends here
