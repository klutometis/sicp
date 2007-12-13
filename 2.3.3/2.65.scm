;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "union-set-tree.scm")
(load "list->tree.scm")
(load "tree->list-2.scm")

(define list-1 '(1 2 3 4))
(define list-2 '(4 5 6 7))

(define tree-1 (list->tree '(1 2 3 4)))
(define tree-2 (list->tree '(4 5 6 7)))

(tree->list-2 (union-set tree-1 tree-2))

;; Less fun, but probably what they're looking for; is also more
;; efficient: theta(3n) ~= theta(n) vs. theta(n log n).

(load "union-set-ordered.scm")
(load "intersection-set-ordered.scm")

(define (union-set-tree tree1 tree2)
  (union-set (tree->list-2 tree1) (tree->list-2 tree2)))

(union-set-tree tree-1 tree-2)

(define (intersection-set-tree tree1 tree2)
  (intersection-set (tree->list-2 tree1) (tree->list-2 tree2)))

(intersection-set-tree tree-1 tree-2)
