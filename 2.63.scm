#!/usr/bin/env chicken-scheme

(use sicp test)
(include "tree-sets.scm")

(define tree-1
  '(7 (3 (1 () ()) (5 () ())) (9 () (11 () ()))))
(define tree-2
  '(3 (1 () ()) (7 (5 () ()) (9 () (11 () ())))))
(define tree-3
  '(5 (3 (1 () ()) ()) (9 (7 () ()) (11 () ()))))

(test-assert (equal? (tree->list-1 tree-1)
                     (tree->list-2 tree-1)))

(test-assert (equal? (tree->list-1 tree-2)
                     (tree->list-2 tree-2)))

(test-assert (equal? (tree->list-1 tree-3)
                     (tree->list-2 tree-3)))
