(load "stream-car.scm")
(load "stream-cdr.scm")
(load "stream-null?.scm")

(define (stream-map proc s)
  (if (stream-null? s)
      the-empty-stream
      (cons-stream (proc (stream-car s))
                   (stream-map proc (stream-cdr s)))))
