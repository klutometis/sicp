(load "stream-map-general.scm")
(load "stream-enumerate-interval.scm")
(load "display-stream.scm")

(define interval0 (stream-enumerate-interval 1 3))
(define interval1 (stream-enumerate-interval 4 6))
(define interval2 (stream-enumerate-interval 5 7))

(display-stream
 (stream-map (lambda (x y z) (+ x y z))
             interval0 interval1 interval2))
