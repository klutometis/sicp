#!/usr/bin/env chicken-scheme

(use sicp srfi-1 test)

(include "polynomial.scm")
(include "polynomial-sub.scm")
(include "polynomial-div.scm")
(include "rational-generic.scm")
(include "greatest-common-divisor.scm")

(define remove-common-factors? (make-parameter #f))

(define (install-greatest-common-divisor-package)
  ;; Copied, unfortunately, from the polynomial package
  (define (make-poly variable term-list) (cons variable term-list))
  (define (variable p) (car p))
  (define (term-list p) (cdr p))
  (define variable? symbol?)

  (define (same-variable? v1 v2)
    (and (variable? v1) (variable? v2) (eq? v1 v2)))
  (define (adjoin-term term term-list)
    (if (=zero? (coeff term))
        term-list
        (cons term term-list)))
  (define (the-empty-termlist) '())
  (define (first-term term-list) (car term-list))
  (define (rest-terms term-list) (cdr term-list))
  (define (empty-termlist? term-list) (null? term-list))
  (define (make-term order coeff) (list order coeff))
  (define (order term) (car term))
  (define (coeff term) (cadr term))
  (define (tag p) (attach-tag 'polynomial p))

  (define (integerizing-factor L1 L2)
    (let ((o1 (order (first-term L1)))
          (o2 (order (first-term L2)))
          (c (coeff (first-term L2))))
      (expt c (+ 1 (- o1 o2)))))
  
  (define (pseudoremainder-terms variable L1 L2)
    (let ((result (div (mul (integerizing-factor L1 L2)
                            (make-polynomial variable L1))
                       (make-polynomial variable L2))))
      (term-list (contents (cadr result)))))

  (define (remove-common-factors L)
    (let* ((factors (map coeff L))
           (gcd (fold greatest-common-divisor
                      ;; This is a little hacky; with out-of-the box
                      ;; gcd, we could have given 0 as the seed.
                      (car factors)
                      (cdr factors))))
      (map (lambda (term) (make-term (order term)
                                (div (coeff term) gcd))) L)))

  (define (gcd-terms variable L1 L2)
    (if (or (empty-termlist? L2)
            (=zero? (make-polynomial variable L2)))
        (if (remove-common-factors?)
            (remove-common-factors L1)
            L1)
        (gcd-terms variable L2 (pseudoremainder-terms variable L1 L2))))

  (define (gcd-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
        (let ((variable (variable p1)))
          (make-polynomial variable (gcd-terms variable
                                               (term-list p1)
                                               (term-list p2))))
        (error "Polys not in same var: GCD-POLY")))

  (define (gcd-scheme-number a b)
    (attach-tag 'scheme-number
                (if (= b 0)
                    0
                    (gcd b (remainder a b)))))

  ;; This should be part of a general coercion; let's fill it in
  ;; ad-hoc here, though. To make this more general, should probably
  ;; also use e.g. adjoin-term instead of map (that would accomodate
  ;; both sparse and dense representations).
  (put 'mul
       '(scheme-number polynomial)
       (lambda (n p)
         (make-polynomial
          (variable p)
          (map (lambda (term)
                 (make-term (order term)
                            (mul n (coeff term))))
               (term-list p)))))

  (put 'greatest-common-divisor
       '(polynomial polynomial)
       gcd-poly)

  (put 'greatest-common-divisor
       '(scheme-number scheme-number)
       gcd-scheme-number))

(install-scheme-number-package)
(install-rational-package)
(install-rational-simplifying-make-package)
(install-complex-package)
(install-negation-package)
(install-polynomial-package)
(install-polynomial-sub-package)
(install-polynomial-div-package)
(install-zero-package)
(install-greatest-common-divisor-package)

(let ((p1 (make-polynomial 'x '((2 1) (1 -2) (0 1))))
      (p2 (make-polynomial 'x '((2 11) (0 7))))
      (p3 (make-polynomial 'x '((1 13) (0 5)))))
  (let ((q1 (mul p1 p2))
        (q2 (mul p1 p3)))
    (test '(polynomial x (2 1458) (1 -2916) (0 1458))
          (greatest-common-divisor q1 q2))
    (parameterize ((remove-common-factors? #t))
      (test p1 (greatest-common-divisor q1 q2)))))
