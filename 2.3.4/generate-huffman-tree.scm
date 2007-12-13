;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "successive-merge.scm")
(load "make-leaf-set.scm")

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))
