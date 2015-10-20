#!/usr/bin/env chicken-scheme
(use sicp test)

(include "fold.scm")

(define l '(1 2 3))

(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) nil sequence))

(test '(3 2 1) (reverse l))

(define (reverse sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))

(test '(3 2 1) (reverse l))
