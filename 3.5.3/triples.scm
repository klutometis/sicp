(load "interleave.scm")
(load "pairs.scm")
(load "stream-append.scm")

(define (triples s t u)
  (let ((x (stream-car s)))
    (cons-stream
     (list x (stream-car t) (stream-car u))
     (interleave
      (interleave
       (stream-map (lambda (y) (list x (stream-car t) y)) (stream-cdr u))
       (stream-map (lambda (pair)
                     (let ((y (car pair))
                           (z (cadr pair)))
                       (list x y z)))
                   (pairs (stream-cdr t) (stream-cdr u))))
      (triples (stream-cdr s) (stream-cdr t) (stream-cdr u))))))
