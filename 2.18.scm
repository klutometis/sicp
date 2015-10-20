#!/usr/bin/env chicken-scheme
(use test)

(define (reverse list)
  (let iter ((reverse '())
             (list list))
    (if (null? list)
        reverse
        (iter (cons (car list) reverse)
              (cdr list)))))

(test '(25 16 9 4 1)
      (reverse (list 1 4 9 16 25)))
