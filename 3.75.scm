#!/usr/bin/env chicken-scheme

(use debug sicp-streams test)

(include "stream-map.scm")

(define (sign-change-detector x y)
  (cond ((or (zero? x) (zero? y) (= (signum x) (signum y))) 0)
        ((positive? y) 1)
        (else -1)))

(define sense-data
  (list->stream '(1 2 1.5 1 0.5 -0.1 -2 -3 -2 -0.5 0.2 3 4)))

(define (make-zero-crossings input-stream last-value)
  (if (stream-null? input-stream)
      stream-null
      (let ((avpt (/ (+ (stream-car input-stream) last-value) 2)))
        (debug (stream->list input-stream)
               avpt
               last-value
               (sign-change-detector avpt last-value))
        (cons-stream
         (sign-change-detector avpt last-value)
         (make-zero-crossings
          (stream-cdr input-stream) avpt)))))

(define zero-crossings
  (make-zero-crossings sense-data 0))

(stream->list zero-crossings)
