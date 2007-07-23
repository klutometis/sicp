(load "make-tree.scm")
(load "entry-tree.scm")
(load "left-branch-tree.scm")
(load "right-branch-tree.scm")
(load "tree->list-1.scm")
(load "tree->list-2.scm")

(define tree-1 (make-tree 7 (make-tree 3 (make-tree 1 '() '()) (make-tree 5 '() '())) (make-tree 9 '() (make-tree 11 '() '()))))
(define tree-2 (make-tree 3 (make-tree 1 '() '()) (make-tree 7 (make-tree 5 '() '()) (make-tree 9 '() (make-tree 11 '() '())))))
(define tree-3 (make-tree 5 (make-tree 3 (make-tree 1 '() '()) '()) (make-tree 9 (make-tree 7 '() '()) (make-tree 11 '() '()))))
(define tree-4 (make-tree 3 '() '()))
(define tree-5 '())
(define trees (list tree-1 tree-2 tree-3 tree-4 tree-5))

(for-each (lambda (tree)
            (let ((list-1 (tree->list-1 tree))
                  (list-2 (tree->list-2 tree)))
              (display list-1)
              (display list-2)
              (display (equal? list-1 list-2))
              (newline)))
            trees)

;; They do produce the same output, since tree->list-2 is merely
;; the iterative form of tree->list-1; they both precede by
;; left-entry-right.

;; tree->list-1 grows more quickly than tree->list-2 since append,
;; as implemented in 2.2.1, requires a consing of the whole list;
;; tree->list-2, on the other hand, makes a cheap cons to an
;; iterative collector.
