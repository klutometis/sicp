#!/usr/bin/env chicken-scheme
(use test)

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(test 3 (count-pairs '(1 2 3)))

(let* ((x (cons 1 (cons 2 '()))))
  (test 5 (count-pairs (cons x x))))

(let* ((x (cons 1 2))
       (y (cons x x)))
  (test 7 (count-pairs (cons y y))))
