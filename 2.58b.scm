#!/usr/bin/env chicken-scheme

(use sicp srfi-1 test)

(define (list-or-symbol x)
  (if (and (pair? x) (null? (cdr x)))
      (car x)
      x))

(define (addend x)
  (list-or-symbol (take-while (lambda (x) (not (eq? x '+))) x)))

(define (augend x)
  (list-or-symbol (cdr (drop-while (lambda (x) (not (eq? x '+))) x))))

(define (sum? x) (and (pair? x) (and (memq '+ x) #t)))

(define multiplier car)

(define (multiplicand x)
  (list-or-symbol (cddr x)))

(define (product? x) (and (pair? x) (eq? (cadr x) '*)))

(test 4 (deriv '(x + 3 * (x + y + 2)) 'x))

(test 5 (deriv '(x * 3 + x * 2 + y * 3) 'x))
