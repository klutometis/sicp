(load "partial-tree.scm")

(define (list->tree elements)
  (car (partial-tree elements (length elements))))
