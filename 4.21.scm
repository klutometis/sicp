#!/usr/bin/env chicken-scheme
(use test)

(test
 "Factorial with Y-combinator"
 3628800
 ((lambda (n)
    ((lambda (fact) (fact fact n))
     (lambda (ft k) (if (= k 1) 1 (* k (ft ft (- k 1)))))))
  10))

(define (f x)
  ((lambda (even? odd?) (even? even? odd? x))
   (lambda (ev? od? n)
     (if (zero? n) #t (od? ev? od? (- n 1))))
   (lambda (ev? od? n)
     (if (zero? n) #f (ev? ev? od? (- n 1))))))

(test-assert "Odd? with Y-combinator" (not (f 15)))
(test-assert "Even? with Y-combinator" (f 16))
