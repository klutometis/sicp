(load "entry-tree.scm")
(load "adjoin-set-tree.scm")
(load "element-of-set-tree.scm")
(load "left-branch-tree.scm")
(load "right-branch-tree.scm")

;; Not theta(n), but theta(n log n); since, for every element of
;; tree1, it must perform a theta(log n) search in tree2
;; (element-of-set?). (?)

(define (union-set tree1 tree2)
  (if (null? tree1)
      tree2
      (let ((left-tree (left-branch tree1))
            (right-tree (right-branch tree1))
            (copy-to-tree (if (element-of-set? (entry tree1) tree2)
                              tree2
                              (adjoin-set (entry tree1) tree2))))
        (union-set left-tree (union-set right-tree copy-to-tree)))))
