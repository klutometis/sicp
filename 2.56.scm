#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.56][2\.56:1]]

(use sicp test)

(define (make-diff a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2))
         (- a1 a2))
        (else (list '- a1 a2))))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        ((exponentiation? exp)
         (let ((base (base exp))
               (exponent (exponent exp)))
           (make-product exponent
                         (make-product
                          (make-exponentiation base (make-diff exponent 1))
                          (deriv base var)))))
        (else
         (error "Unknown expression type: DERIV" exp))))

(define (exponentiation? x) (and (pair? x) (eq? (car x) '**)))

(define base cadr)

(define exponent caddr)

(define (make-exponentiation b e)
  (cond ((=number? e 0) 1)
        ((=number? e 1) b)
        ((and (number? b) (number? e))
         (expt b e))
        (else (list '** b e))))

(test '(* y (** x (- y 1))) (deriv '(** x y) 'x))
(test '(* 2 x) (deriv '(** x 2) 'x))

;; 2\.56:1 ends here
