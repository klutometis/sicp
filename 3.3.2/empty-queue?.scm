(load "front-ptr.scm")

(define (empty-queue? queue) (null? (front-ptr queue)))
