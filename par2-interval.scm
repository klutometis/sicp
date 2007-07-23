(load "div-interval.scm")
(load "add-interval.scm")

(define (par2-interval r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))
