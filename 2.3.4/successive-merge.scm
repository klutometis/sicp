(load "adjoin-set.scm")
(load "make-code-tree.scm")
(load "make-leaf.scm")
(load "make-code-tree.scm")

(define (successive-merge trees)
  (if (= 1 (length trees))
      ;; For some reason, we have a superfluous list; merged with '()?
      (car trees)
      (let ((lightest-tree (car trees))
            (lighter-tree (cadr trees))
            (heavier-trees (cddr trees)))
        (successive-merge (adjoin-set (make-code-tree lightest-tree lighter-tree) heavier-trees)))))
