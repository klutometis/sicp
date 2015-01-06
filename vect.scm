#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.46][2\.46:1]]

(define make-vect cons)
(define xcor-vect car)
(define ycor-vect cdr)

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1)
                (xcor-vect v2))
             (+ (ycor-vect v1)
                (ycor-vect v2))))

(define (sub-vect v1 v2)
  (add-vect v1 (make-vect (- (xcor-vect v2))
                          (- (ycor-vect v2)))))

(define (scale-vect s v1)
  (make-vect (* s (xcor-vect v1))
             (* s (ycor-vect v1))))

;; 2\.46:1 ends here
