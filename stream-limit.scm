#!/usr/bin/env chicken-scheme

(define (stream-limit stream tolerance)
  (let iter ((car (stream-car stream))
             (cdr (stream-cdr stream))
             (iterations 0))
    (let ((cadr (stream-car cdr)))
      (if (< (abs (- cadr car)) tolerance)
          (values cadr iterations)
          (iter cadr (stream-cdr cdr) (+ iterations 1))))))
