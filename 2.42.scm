#!/usr/bin/env chicken-scheme
(use sicp srfi-1 test)

(define empty-board '())

(define (slope x1 y1 x2 y2)
  (/ (- y2 y1) (- x2 x1)))

(define (safe? k positions)
  (let ((kth-position (list-ref positions (- k 1))))
    (let iter ((positions positions)
               (i 1))
      (or (null? positions)
          (if (= i k)
              (iter (cdr positions) (+ i 1))
              (let* ((ith-position (car positions))
                     (slope (slope i ith-position
                                   k kth-position)))
                (and (not (or (= slope 0)
                              (= (abs slope) 1)))
                     (iter (cdr positions) (+ i 1)))))))))

(define (adjoin-position new-row k rest-of-queens)
  (append (take rest-of-queens (- k 1))
          (list new-row)
          (drop rest-of-queens (- k 1))))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(time (test 92 (length (queens 8))))
