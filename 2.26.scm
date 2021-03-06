#!/usr/bin/env chicken-scheme
(use test)

(define x (list 1 2 3))
(define y (list 4 5 6))

(test '(1 2 3 4 5 6) (append x y))
(test '((1 2 3) 4 5 6) (cons x y))
(test '((1 2 3) (4 5 6)) (list x y))
