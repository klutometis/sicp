#!/usr/bin/env chicken-scheme
(use sicp srfi-1 test)

(include "polynomial.scm")
(include "polynomial-sub.scm")
(include "polynomial-div.scm")
(include "rational-generic.scm")
(include "greatest-common-divisor.scm")

(define (install-reduction-package)
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

  (define (integerizing-factor o1 t2)
    (let ((o2 (order t2))
          (c (coeff t2)))
      (expt c (+ 1 (- o1 o2)))))
  
  (define (pseudoremainder-terms variable L1 L2)
    (let ((result (div (mul (integerizing-factor
                             (order (first-term L1))
                             (first-term L2))
                            (make-polynomial variable L1))
                       (make-polynomial variable L2))))
      (term-list (contents (cadr result)))))

  (define (greatest-common-divisor-coefficients L)
    (let ((factors (map coeff L)))
      (fold greatest-common-divisor
            (car factors)
            (cdr factors))))

  (define (divide-through factor L)
    (map (lambda (term) (make-term (order term)
                              (div (coeff term) factor)))
         L))

  (define (remove-common-factors L)
    (let ((gcd (greatest-common-divisor-coefficients L)))      
      (divide-through gcd L)))

  (define (gcd-terms variable L1 L2)
    (if (or (empty-termlist? L2)
            (=zero? (make-polynomial variable L2)))
        (remove-common-factors L1)
        (gcd-terms variable L2 (pseudoremainder-terms variable L1 L2))))

  (define (reduce-terms variable L1 L2)
    (let* ((gcd-terms (gcd-terms variable L1 L2))
           (factor (integerizing-factor
                    (max (order (first-term L1))
                         (order (first-term L2)))
                    (first-term gcd-terms))))
      (let ((gcd-coefficients
             (greatest-common-divisor-coefficients
              (append L1 L2))))
        (let ((reduce
               (lambda (L)
                 (divide-through
                  gcd-coefficients
                  (term-list
                   (contents
                    (car
                     (div (mul factor (make-polynomial variable L))
                          (make-polynomial variable gcd-terms)))))))))
          (list (reduce L1)
                (reduce L2))))))

  (define (reduce-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
        (let* ((variable (variable p1))
               (term-lists (reduce-terms variable
                                         (term-list p1)
                                         (term-list p2))))
          (list (make-polynomial variable (car term-lists))
                (make-polynomial variable (cadr term-lists))))
        (error "Polys not in same var: REDUCE-POLY")))

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
       gcd-scheme-number)

  (put 'simplify
       '(polynomial polynomial)
       reduce-poly)

  (put 'simplify
     '(scheme-number scheme-number)
     (lambda (n d)
       (let ((g (gcd n d)))
         (list (/ n g) (/ d g)))))) 

(define (simplify x y)
  (apply-generic 'simplify x y))

(define (install-simplifying-rational-package)
  ;; internal procedures
  (define (numer x) (car x))
  (define (denom x) (cdr x))

  (define (make-rat n d)
    (apply cons (simplify n d)))
  (define (add-rat x y)
    (make-rat (add (mul (numer x) (denom y))
                   (mul (numer y) (denom x)))
              (mul (denom x) (denom y))))
  (define (sub-rat x y)
    (make-rat (sub (mul (numer x) (denom y))
                   (mul (numer y) (denom x)))
              (mul (denom x) (denom y))))
  (define (mul-rat x y)
    (make-rat (mul (numer x) (numer y))
              (mul (denom x) (denom y))))
  (define (div-rat x y)
    (make-rat (mul (numer x) (denom y))
              (mul (denom x) (numer y))))
  ;; interface to rest of the system
  (define (tag x) (attach-tag 'rational x))
  (put 'add '(rational rational)
       (lambda (x y) (tag (add-rat x y))))
  (put 'sub '(rational rational)
       (lambda (x y) (tag (sub-rat x y))))
  (put 'mul '(rational rational)
       (lambda (x y) (tag (mul-rat x y))))
  (put 'div '(rational rational)
       (lambda (x y) (tag (div-rat x y))))
  (put 'make 'rational
       (lambda (n d) (tag (make-rat n d))))
  (put 'numer '(rational) numer)
  (put 'denom '(rational) denom)
  'done)

(install-scheme-number-package)
(install-rational-package)
(install-rational-simplifying-make-package)
(install-complex-package)
(install-negation-package)
(install-polynomial-package)
(install-polynomial-sub-package)
(install-polynomial-div-package)
(install-zero-package)
(install-reduction-package)
(install-simplifying-rational-package)

(let ((p1 (make-polynomial 'x '((1 1) (0 1))))
      (p2 (make-polynomial 'x '((3 1) (0 -1))))
      (p3 (make-polynomial 'x '((1 1))))
      (p4 (make-polynomial 'x '((2 1) (0 -1)))))
  (let ((rf1 (make-rational p1 p2))
        (rf2 (make-rational p3 p4)))
    (test '(rational
            (polynomial x (3 1) (2 2) (1 3) (0 1) (0 0))
            polynomial x (4 1) (3 1) (1 -1) (0 -1) (0 0))
          (add rf1 rf2))))
