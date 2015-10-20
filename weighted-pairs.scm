#!/usr/bin/env chicken-scheme
(define (weighted-merge weight s1 s2)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
         (let ((s1car (stream-car s1))
               (s2car (stream-car s2)))
           (cond ((< (weight s1car) (weight s2car))
                  (cons-stream
                   s1car
                   (weighted-merge weight (stream-cdr s1) s2)))
                 (else
                  (cons-stream
                   s2car
                   (weighted-merge weight s1 (stream-cdr s2)))))))))

(define (weighted-pairs weight s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (weighted-merge
    weight
    (stream-map (lambda (x) (list (stream-car s) x))
                (stream-cdr t))
    (weighted-pairs weight (stream-cdr s) (stream-cdr t)))))
