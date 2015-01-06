#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.21][2\.21:1]]

(use (only sicp nil square) test)

(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list (cdr items)))))

(test '(1 4 9 16) (square-list (list 1 2 3 4)))

(define (square-list items)
  (map square items))

(test '(1 4 9 16) (square-list (list 1 2 3 4)))

;; 2\.21:1 ends here
