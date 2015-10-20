#!/usr/bin/env chicken-scheme
(use test)

(define (equal? l1 l2)
  (cond ((and (symbol? l1) (symbol? l2))
         (eq? l1 l2))
        ((and (number? l1) (number? l2))
         (= l1 l2))
        ((and (pair? l1) (pair? l2))
         (and (equal? (car l1) (car l2))
              (equal? (cdr l1) (cdr l2))))))

(test-assert (equal? '(this is a list) '(this is a list)))
(test-assert (not (equal? '(this is a list) '(this (is a) list))))
