(load "make-connector.scm")
(load "constant.scm")

(define (cv x)
  (let ((y (make-connector)))
    (constant x y)
    y))
