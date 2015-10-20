#!/usr/bin/env chicken-scheme
(use numbers random-bsd sicp sicp-streams test)

(include "stream-map.scm")

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (* (random-real) range))))

(define (make-random-numbers low high)
  (cons-stream (random-in-range low high)
               (make-random-numbers low high)))

(define (pi-predicate x y)
  (<= (+ (square (- 1 x))
         (square (- 1 y)))
      1))

(define (make-integral-stream predicate x1 x2 y1 y2)
  (stream-map
   (lambda (x y) (predicate x y))
   (make-random-numbers x1 x2)
   (make-random-numbers y1 y2)))

(define (monte-carlo experiment-stream passed failed)
  (define (next passed failed)
    (cons-stream
     (/ passed (+ passed failed))
     (monte-carlo
      (stream-cdr experiment-stream) passed failed)))
  (if (stream-car experiment-stream)
      (next (+ passed 1) failed)
      (next passed (+ failed 1))))

(define (estimate-integral predicate x1 x2 y1 y2)
  (monte-carlo (make-integral-stream predicate x1 x2 y1 y2) 0 0))

(parameterize ((current-test-epsilon 0.01))
  (test
   3.14
   (exact->inexact
    (* 4 (stream-ref (estimate-integral pi-predicate 0 1 0 1) 10000)))))
