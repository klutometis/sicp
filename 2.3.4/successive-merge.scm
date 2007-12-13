;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

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
