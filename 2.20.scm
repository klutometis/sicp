#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.20][2\.20:1]]

(use test)

(define (filter predicate? list)
  (if (null? list)
      '()
      (if (predicate? (car list))
          (cons (car list) (filter predicate? (cdr list)))
          (filter predicate? (cdr list)))))

(define (same-parity . numbers)
  (if (even? (car numbers))
      (filter even? numbers)
      (filter odd? numbers)))

;; Non-branching alternative
(define (same-parity a . rest)
  (cons a (filter (lambda (n) (= (remainder a 2) (remainder n 2))) rest)))

(test '(1 3 5 7) (same-parity 1 2 3 4 5 6 7))
(test '(2 4 6) (same-parity 2 3 4 5 6 7))

;; 2\.20:1 ends here
