#!/usr/bin/env chicken-scheme
(use sicp-streams test)

(define (all-pairs s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (stream-map (lambda (x) (list (stream-car s) x))
                (stream-cdr t))
    (interleave
     (stream-map (lambda (y) (list (stream-car t) y))
                 (stream-cdr s))
     (all-pairs (stream-cdr s) (stream-cdr t))))))

(define (stream-index pred . streams)
  (let iter ((index 0)
             (streams streams))
    (if (any stream-null? streams)
        #f
        (if (apply pred (map stream-car streams))
            index
            (iter (+ index 1) (map stream-cdr streams))))))

(define (pair-index pair stream)
  (stream-index (cute equal? <> pair) stream))

(let ((pairs (all-pairs integers integers)))
   (test 17 (pair-index '(1 10) pairs))
   (test 64 (pair-index '(2 10) pairs))
   (test 228 (pair-index '(3 10) pairs)))
