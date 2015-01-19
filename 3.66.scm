#!/usr/bin/env chicken-scheme

(use sicp-streams srfi-1 test)

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

(define (lower-bound pair)
  (let ((x (car pair))
        (y (cadr pair)))
    (let iter ((row (- (max x (/ (log y) (log 2))) 1))
               (lower-bound 0))
      (if (or (zero? row) (negative? row))
          (inexact->exact (floor lower-bound))
          (iter (- row 1) (+ lower-bound (expt 2 row)))))))

(let ((integer-pairs (lambda () (pairs integers integers))))
  (test '((1 1) (1 2) (2 2) (1 3) (2 3) (1 4) (3 3) (1 5)
          (2 4) (1 6) (3 4) (1 7) (2 5) (1 8) (4 4))
    (stream->list (integer-pairs) 15))

  (test "The lower bound is exact on diagonals"
        (pair-index '(10 10) (integer-pairs))
        (lower-bound '(10 10)))

  ;; For the case where y = 10.
  (let ((pair-indexes
         (map (lambda (x) (pair-index (list x 10) (integer-pairs)))
              (iota 10 1)))
        (lower-bounds
         (map (lambda (x) (lower-bound (list x 10)))
              (iota 10 1))))
    (test
     pair-indexes
     '(17 32 58 102 174 286 446 638 766 1022))

    (test
     lower-bounds
     '(8 8 8 14 30 62 126 254 510 1022))

    (test-assert (every <= lower-bounds pair-indexes))))
