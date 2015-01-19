#!/usr/bin/env chicken-scheme

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

  (define (gcd-terms variable L1 L2)
    (if (or (empty-termlist? L2)
            (=zero? (make-polynomial variable L2)))
        L1
        (gcd-terms variable L2 (remainder-terms variable L1 L2))))

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

(define (greatest-common-divisor n1 n2)
  (apply-generic 'greatest-common-divisor n1 n2))

(define (install-rational-simplifying-make-package)
  (define (make-rat n d)
    (let ((g (greatest-common-divisor n d)))
      (cons (div n g) (div d g))))
  (put 'make 'rational
       (lambda (n d)
         (attach-tag 'rational (make-rat n d)))))
