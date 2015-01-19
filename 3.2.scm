#!/usr/bin/env chicken-scheme

(use test)

(define (make-monitored f)
  (let ((calls 0))
    (lambda (message)
      (case message
        ((how-many-calls?) calls)
        ((reset-count) (set! calls 0))
        (else (set! calls (+ calls 1))
              (f message))))))

(let ((s (make-monitored sqrt)))
  (test 10.0 (s 100))
  (test 1 (s 'how-many-calls?)))
