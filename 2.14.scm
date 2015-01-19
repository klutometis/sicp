#!/usr/bin/env chicken-scheme

(use test)

(include "interval-percent.scm")

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one (add-interval (div-interval one r1)
                       (div-interval one r2)))))

(let ((r (make-center-percent 6.8 0.1)))
  (let ((p1 (par1 r r))
        (p2 (par2 r r)))
    (test 3.5374 (center p1))
    (test 0.292233 (percent p1))
    (test 3.4 (center p2))
    (test 0.1 (percent p2))))
