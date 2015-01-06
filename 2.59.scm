#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.59][2\.59:1]]

(use sicp test)

(define (union-set set1 set2)
  (if (null? set1)
      set2
      (if (element-of-set? (car set1) set2)
          (union-set (cdr set1) set2)
          (union-set (cdr set1) (cons (car set1) set2)))))

(let ((set1 '(1 2 3))
      (set2 '(3 4 5)))
  (test '(2 1 3 4 5) (union-set set1 set2)))

;; 2\.59:1 ends here
