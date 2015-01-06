#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.17][2\.17:1]]

(use test)

(define (last-pair list)
  (if (null? (cdr list))
      list
      (last-pair (cdr list))))

(test '(34) (last-pair (list 23 72 149 34)))

;; 2\.17:1 ends here
