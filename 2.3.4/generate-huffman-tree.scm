(load "successive-merge.scm")
(load "make-leaf-set.scm")

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))
