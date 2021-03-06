#!/usr/bin/env chicken-scheme
(use ports sicp test)

(define print-queue (compose display car))

(define q1 (make-queue))
(test "(a)"
      (with-output-to-string (lambda () (print-queue (insert-queue! q1 'a)))))
(test "(a b)"
      (with-output-to-string (lambda () (print-queue (insert-queue! q1 'b)))))
(test "(b)"
      (with-output-to-string (lambda () (print-queue (delete-queue! q1)))))
(test "()"
      (with-output-to-string (lambda () (print-queue (delete-queue! q1)))))
