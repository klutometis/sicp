#!/usr/bin/env chicken-scheme

(use test)

(include "ordered-sets.scm")
(include "union-set.scm")
(include "tree-sets.scm")

(define (tree-union-set tree1 tree2)
  (list->tree (union-set (tree->list-2 tree1)
                         (tree->list-2 tree2))))

(define (tree-intersection-set tree1 tree2)
  (list->tree (intersection-set (tree->list-2 tree1)
                                (tree->list-2 tree2))))

(define tree1 (list->tree '(1 3 6 10)))

(define tree2 (list->tree '(0 2 3 7 12)))

(test '(0 1 2 3 6 7 10 12)
      (tree->list-2 (tree-union-set tree1 tree2)))
