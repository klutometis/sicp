#!/usr/bin/env chicken-scheme

(use sicp-streams test)

(include "stream-map.scm")

(define (sign-change-detector x y)
  (cond ((or (zero? x) (zero? y) (= (signum x) (signum y))) 0)
        ((positive? y) 1)
        (else -1)))

(define sense-data
  (list->stream '(1 2 1.5 1 0.5 -0.1 -2 -3 -2 -0.5 0.2 3 4)))

(define smooth
  (case-lambda ((stream) (smooth stream 0 0))
          ((stream last-value last-last-value)
           (if (stream-null? stream)
               stream
               (let ((value (+ last-value (/ (- (stream-car stream) last-last-value) 2))))
                 (cons-stream value
                              (smooth (stream-cdr stream) value last-value)))))))

(define (make-zero-crossings sense-data)
  (stream-map sign-change-detector sense-data (stream-cdr sense-data)))

(test '(0 0 0 0 0 -1 0 0 0 0 1 0)
      (stream->list (make-zero-crossings (smooth sense-data))))
