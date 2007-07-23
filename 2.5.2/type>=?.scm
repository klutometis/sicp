(load "raise.scm")
(load "raise?.scm")
(load "type=?.scm")
(load "type-tag.scm")
(load "get.scm")

(define (type>=? x1 x2)
  (if (type=? x1 x2)
      #t
      (if (raise? x2)
          (type>=? x1 (raise x2))
          ;; Can't raise anymore and not equal; therefore, less
          ;; than (if raise system is complete).
          #f)))
