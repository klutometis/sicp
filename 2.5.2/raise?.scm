(load "type-tag.scm")
(load "get.scm")

(define (raise? x)
  (not (not (get 'raise (list (type-tag x))))))
