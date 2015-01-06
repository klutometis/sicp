#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.30][2\.30:1]]

(use sicp test)

(define (square-tree-direct tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree-direct (car tree))
                    (square-tree-direct (cdr tree))))))

(define (square-tree-map tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree-map sub-tree)
             (square sub-tree)))
       tree))

(define tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(test '(1 (4 (9 16) 25) (36 49)) (square-tree-direct tree))
(test '(1 (4 (9 16) 25) (36 49)) (square-tree-map tree))

;; 2\.30:1 ends here
