#!/usr/bin/env chicken-scheme

(use sicp-eval sicp-eval-amb srfi-1)

(with-require `((list ,list)
                (list-ref ,list-ref)
                (- ,-)
                (or ,(lambda (p q) (or p q)))
                (= ,=)
                (+ ,+)
                (/ ,/) 
                (abs ,abs))
  (lambda (env)
    (ambeval*
     '(define (slope x1 y1 x2 y2)
        (/ (- y2 y1) (- x2 x1)))
     env) 
    (ambeval*
     '(define (safe? k positions)
        (let ((kth-position (list-ref positions (- k 1))))
          (define (iter positions i)
            (if (null? positions)
                true
                (if (= i k)
                    (iter (cdr positions) (+ i 1))
                    (let ((ith-position (car positions)))
                      (let ((slope (slope i ith-position k kth-position)))
                        (if (or (= slope 0)
                                (= (abs slope) 1))
                            false
                            (iter (cdr positions) (+ i 1))))))))
          (iter positions 1)))
     env)
    (ambeval*
     '(define (queens)
        (let ((q1 (amb 1 2 3 4 5 6 7 8)))
          (require (safe? 1 (list q1)))
          (let ((q2 (amb 1 2 3 4 5 6 7 8)))
            (require (safe? 2 (list q1 q2)))
            (let ((q3 (amb 1 2 3 4 5 6 7 8)))
              (require (safe? 3 (list q1 q2 q3)))
              (let ((q4 (amb 1 2 3 4 5 6 7 8)))
                (require (safe? 4 (list q1 q2 q3 q4)))
                (let ((q5 (amb 1 2 3 4 5 6 7 8)))
                  (require (safe? 5 (list q1 q2 q3 q4 q5)))
                  (let ((q6 (amb 1 2 3 4 5 6 7 8)))
                    (require (safe? 6 (list q1 q2 q3 q4 q5 q6)))
                    (let ((q7 (amb 1 2 3 4 5 6 7 8)))
                      (require (safe? 7 (list q1 q2 q3 q4 q5 q6 q7)))
                      (let ((q8 (amb 1 2 3 4 5 6 7 8)))
                        (require (safe? 8 (list q1 q2 q3 q4 q5 q6 q7 q8)))
                        (list q1 q2 q3 q4 q5 q6 q7 q8))))))))))
     env)
    (test "There are 92 solutions to 8-queens."
          92
          (length (ambeval* '(queens) env)))))
