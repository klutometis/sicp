#!/usr/bin/env chicken-scheme
(use sicp test)
(include "ordered-sets.scm")

(define (adjoin-set x set)
  (if (null? set)
      (list x)
      (let ((first (car set)))
        (if (< first x)
            (cons first (adjoin-set x (cdr set)))
            (cons x set)))))

(define set '(1 3 6 10))

(test '(1 3 5 6 10) (adjoin-set 5 '(1 3 6 10)))
(test '(5) (adjoin-set 5 '()))
