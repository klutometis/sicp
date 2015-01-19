#!/usr/bin/env chicken-scheme

(use ports sicp-streams test)

(define (show x) (display x) x)

(let ((x (make-parameter #f)))
  (test "0"
        (with-output-to-string
          (lambda ()
            (x (stream-map show (stream-enumerate-interval 0 10))))))
  (test "12345"
        (with-output-to-string
          (lambda () (stream-ref (x) 5))))
  (test "67"
        (with-output-to-string
          (lambda () (stream-ref (x) 7)))))
