#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.95][2\.95:1]]

(use debug sicp test)

(include "polynomial.scm")
(include "polynomial-sub.scm")
(include "polynomial-div.scm")
(include "rational-generic.scm")
(include "greatest-common-divisor.scm")

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

  (define (remainder-terms variable L1 L2)
    (let ((result (div (make-polynomial variable L1)
                       (make-polynomial variable L2))))
      (term-list (contents (cadr result)))))

  (trace remainder-terms)

  (define (gcd-terms variable L1 L2)
    (if (or (empty-termlist? L2)
            (=zero? (make-polynomial variable L2)))
        L1
        (gcd-terms variable L2 (remainder-terms variable L1 L2))))

  (trace gcd-terms)

  (define (gcd-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
        (let ((variable (variable p1)))
          (make-polynomial variable (gcd-terms variable
                                               (term-list p1)
                                               (term-list p2))))
        (error "Polys not in same var: GCD-POLY")))

  (define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

  (define (gcd-scheme-number a b)
    (attach-tag 'scheme-number
                (gcd a b)))

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
    (test-assert (not (equal? p1 (greatest-common-divisor q1 q2))))))

;; 2\.95:1 ends here
