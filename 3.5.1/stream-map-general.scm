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
