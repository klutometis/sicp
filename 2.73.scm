#!/usr/bin/env chicken-scheme

(use sicp srfi-69 test)

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp))
               (operands exp) var))))

(define (operator exp) (car exp))

(define (operands exp) (cdr exp))

(define dispatch-table (make-parameter (make-hash-table)))

(define (put op type proc)
  (hash-table-set! (dispatch-table) (cons op type) proc))

(define (get op type)
  (hash-table-ref/default (dispatch-table) (cons op type) #f))

(define (install-sum-and-product-package)
  (define addend car)
  (define augend cadr)

  (define (deriv-sum exp var)
    (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var)))

  (define multiplicand car)
  (define multiplier cadr)

  (define (deriv-product exp var)
    (make-sum
     (make-product (multiplier exp)
                   (deriv (multiplicand exp) var))
     (make-product (deriv (multiplier exp) var)
                   (multiplicand exp))))

  (put 'deriv '+ deriv-sum)
  (put 'deriv '* deriv-product)
  'done)

(install-sum-and-product-package)

(test 'y (deriv '(* x y) 'x))
(test 1 (deriv '(+ x y) 'x))

(define (install-exponent-package)
  (define base car)
  (define exponent cadr)

  (define (make-exponentiation b e)
    (cond ((=number? e 0) 1)
          ((=number? e 1) b)
          ((and (number? b) (number? e))
           (expt b e))
          (else (list '** b e))))
  (define (make-diff a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2))
           (- a1 a2))
          (else (list '- a1 a2))))

  (define (deriv-exponent exp var)
    (let ((base (base exp))
          (exponent (exponent exp)))
      (make-product exponent
                    (make-product
                     (make-exponentiation base (make-diff exponent 1))
                     (deriv base var)))))

  (put 'deriv '** deriv-exponent)
  'done)

(install-exponent-package)

(test '(* y (** x (- y 1))) (deriv '(** x y) 'x))
(test '(* 2 x) (deriv '(** x 2) 'x))
