#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*1.46][1\.46:1]]

(use test)

(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (let iter ((guess guess))
      (if (good-enough? guess)
          guess
          (iter (improve guess))))))

(define epsilon (make-parameter 0.00001))

(define (square x) (* x x))

(define (average x y) (/ (+ x y) 2))

(define (sqrt-iter guess x)
  ((iterative-improve
    (lambda (guess)
      (< (abs (- (square guess) x)) (epsilon)))
    (lambda (guess)
      (average guess (/ x guess))))
   guess))

(define (sqrt x) (sqrt-iter 1.0 x))

(test 2.0 (sqrt 4))

(define (fixed-point f guess)
  ((iterative-improve
    (lambda (guess)
      ;; This results in the application of f twice, unfortunately.
      (< (abs (- guess (f guess))) (epsilon)))
    f)
   guess))

(test 0.73909 (fixed-point cos 1.0))

;; 1\.46:1 ends here
