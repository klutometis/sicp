#!/usr/bin/env chicken-scheme

(use test)

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define (cycle? x)
  (let iter ((tortoise (cdr x))
             (hare (cddr x)))
    (and (not (null? hare))
         (or (eq? tortoise hare)
             (and (not (null? (cdr hare)))
                  (iter (cdr tortoise) (cddr hare)))))))

(test-assert (not (cycle? '(1 2 1))))
(test-assert (cycle? (make-cycle (list 1 2 1))))
