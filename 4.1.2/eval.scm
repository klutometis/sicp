(load "type-tag.scm")
(load "get.scm")

(define (eval exp env)
  ((get (type-tag exp)) exp env))
