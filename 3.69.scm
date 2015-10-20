#!/usr/bin/env chicken-scheme
(use bindings sicp sicp-streams test)

(define (triples s t u)
  (cons-stream (list (stream-car s) (stream-car t) (stream-car u))
               (interleave
                (interleave
                 ;; Generate along x.
                 (stream-map (lambda (z) (list (stream-car s)
                                          (stream-car t)
                                          z))
                             (stream-cdr u))
                 ;; Generate along x and y.
                 (stream-map (lambda (pair)
                               (list (stream-car s)
                                     (car pair)
                                     (cadr pair)))
                             (pairs (stream-cdr t)
                                    (stream-cdr u))))
                (triples (stream-cdr s)
                         (stream-cdr t)
                         (stream-cdr u)))))

(test '((3 4 5) (6 8 10) (5 12 13))
      (stream->list
       (stream-filter
        (bind-lambda (i j k)
                (= (+ (square i) (square j)) (square k)))
        (triples integers integers integers))
       3))
