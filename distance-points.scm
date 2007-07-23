(load "x-point.scm")
(load "y-point.scm")

(define (distance-points p1 p2)
  (sqrt (+
         (square (- (x-point p2) (x-point p1)))
         (square (- (y-point p2) (y-point p1))))))
