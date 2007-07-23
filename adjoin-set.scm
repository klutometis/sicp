(load "element-of-set.scm")

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))
