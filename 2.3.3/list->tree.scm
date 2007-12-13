;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "partial-tree.scm")

(define (list->tree elements)
  (car (partial-tree elements (length elements))))
