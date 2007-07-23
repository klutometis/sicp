(load "leaf?.scm")
(load "symbol-leaf.scm")

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
