#!/usr/bin/env chicken-scheme

(use sicp test)

(define (count-leaves t)
  (accumulate + 0 (map (lambda (subtree)
                         (if (pair? subtree)
                             (count-leaves subtree)
                             (if (null? subtree) 0 1)))
                       t)))

(define x (cons (list 1 2 '()) (list 3 4)))

(test 4 (count-leaves x))
(test 8 (count-leaves (list x x)))
