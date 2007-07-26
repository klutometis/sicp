(load "stream-null?.scm")
(load "stream-car.scm")
(load "stream-cdr.scm")

(define (stream-for-each proc s)
  (if (stream-null? s)
      'done
      (begin (proc (stream-car s))
             (stream-for-each proc (stream-cdr s)))))
