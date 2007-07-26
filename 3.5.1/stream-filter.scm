(load "the-empty-stream.scm")
(load "stream-null?.scm")
(load "stream-car.scm")
(load "stream-cdr.scm")

(define (stream-filter pred stream)
  (cond ((stream-null? stream) the-empty-stream)
        ((pred (stream-car stream))
         (cons-stream (stream-car stream)
                      (stream-filter pred
                                     (stream-cdr stream))))
        (else (stream-filter pred (stream-cdr stream)))))
