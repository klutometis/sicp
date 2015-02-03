#!/usr/bin/env chicken-scheme

(use sicp-streams test)

(include "stream-map.scm")

(define (sign-change-detector x y)
  (cond ((or (zero? x) (zero? y) (= (signum x) (signum y))) 0)
        ((positive? y) 1)
        (else -1)))

(define sense-data
  (list->stream '(1 2 1.5 1 0.5 -0.1 -2 -3 -2 -0.5 0.2 3 4)))

;;; Using simple moving average
(define (make-zero-crossings input-stream last-value last-last-value)
  (if (stream-null? input-stream)
      stream-null
      (let ((avpt (+ last-value (/ (- (stream-car input-stream) last-last-value) 2))))
        (cons-stream
         (sign-change-detector last-value avpt)
         (make-zero-crossings
          (stream-cdr input-stream)
          avpt
          last-value)))))

(define zero-crossings
  (make-zero-crossings sense-data 0 0))

(test '(0 0 0 0 0 0 -1 0 0 0 0 1 0)
      (stream->list zero-crossings))
