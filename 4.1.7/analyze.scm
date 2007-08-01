(load "get.scm")
(load "type-tag.scm")

(define (analyze exp)
  ((get (type-tag exp)) exp))
