(load "type-tag.scm")
(load "get.scm")

(define (project? x)
  (not (not (get 'project (list (type-tag x))))))

