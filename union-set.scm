(load "adjoin-set.scm")

(define (union-set set1 set2)
  (if (null? set1)
      set2
      (adjoin-set (car set1)
                  (union-set (cdr set1) set2))))
