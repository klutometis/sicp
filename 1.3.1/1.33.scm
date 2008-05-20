;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../util/util)
(import* util square identity)

(define (divides? a b)
  (= (remainder b a) 0))

;; "Naive" implementation (sans weeding out 2s).
(define (next-divisor divisor)
  (+ divisor 1))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next-divisor test-divisor)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (filtered-accumulate filter? combiner null-value term a next b)
  (if (> a b)
      null-value
      (let ((combinandum (if (filter? a) (term a) null-value)))
        (combiner combinandum
                  (filtered-accumulate filter?
                                       combiner
                                       null-value
                                       term
                                       (next a)
                                       next
                                       b)))))

(define (sum filter? term a next b)
  (filtered-accumulate filter? + 0 term a next b))

(define (product filter? term a next b)
  (filtered-accumulate filter? * 1 term a next b))

(define (sum-primes a b)
  (sum prime? identity a (lambda (n) (+ n 1)) b))

(define (product-relative-primes n)
  (product (lambda (m) (= (gcd m n) 1))
           identity
           1
           (lambda (n) (+ n 1))
           n))

;; Sigma {even numbers in 1-10}
(check (sum (lambda (n) (even? n))
            identity
            1
            (lambda (n) (+ n 1))
            10)
       => 30)

(check (sum-primes 1 10) => 18)

(check (product-relative-primes 10) => 189)
