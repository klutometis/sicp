#!/usr/bin/env chicken-scheme
(use random-bsd sicp test)

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (* (random-real) range))))

(define (monte-carlo trials experiment)
  (let iter ((trials-remaining trials)
             (trials-passed 0))
    (cond ((zero? trials-remaining)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1)
                 (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1)
                 trials-passed)))))

(define (estimate-integral p x1 x2 y1 y2 trials)
  (monte-carlo
   trials
   (lambda ()
     (let ((x (random-in-range x1 x2))
           (y (random-in-range y1 y2)))
       (p x y)))))

(define (pi-predicate x y)
  ;; Can also test against x instead of 1 - x.
  (<= (+ (square (- 1 x))
         (square (- 1 y)))
      ;; Superfluous square
      (square 1)))

(define (estimate-pi trials)
  (* 4 (estimate-integral pi-predicate 0 1 0 1 trials)))

(parameterize ((current-test-epsilon 0.01))
  (test 3.14 (estimate-pi 10000)))
