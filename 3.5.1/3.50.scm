(load "stream-map.scm")
(load "stream-enumerate-interval.scm")
(load "display-stream.scm")
(load "stream-null?.scm")
(load "the-empty-stream.scm")
(load "stream-car.scm")
(load "stream-cdr.scm")

(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (cons-stream
       (apply proc (map stream-car argstreams))
       (apply stream-map
              (cons proc (map stream-cdr argstreams))))))

(define interval0 (stream-enumerate-interval 1 3))
(define interval1 (stream-enumerate-interval 4 6))
(define interval2 (stream-enumerate-interval 5 7))

(display-stream
 (stream-map (lambda (x y z) (+ x y z)) interval0 interval1 interval2))
