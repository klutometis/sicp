#!/usr/bin/env chicken-scheme

(use test)

(define (cube x) (* x x x))

(define (inc n) (+ n 1))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

(define (simpsons-rule f a b n)
  (let ((h (/ (- b a) n)))
    (* (/ h 3)
       (sum (lambda (k)
              (let ((coefficient
                     (cond ((or (zero? k) (= k n)) 1)
                           ((odd? k ) 4)
                           (else 2))))
                (* coefficient (f (+ a (* k h))))))
            0
            inc
            n))))

(test
 "Simpson's rule is correct for cube, 0, 1; even at n = 100."
 0.25
 (simpsons-rule cube 0 1 100))

(test
 "Simpson's rule differs from the naïve integral a little."
 0.000000124999999268072
 (abs
  (- (simpsons-rule cube 0 1 1000)
     (integral cube 0 1 0.001))))
