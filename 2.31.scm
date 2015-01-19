#!/usr/bin/env chicken-scheme

(use sicp test)

(define (tree-map f tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map f sub-tree)
             (f sub-tree)))
       tree))

(define (square-tree tree) (tree-map square tree))

(define tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
    
(test '(1 (4 (9 16) 25) (36 49)) (square-tree tree))
