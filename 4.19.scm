#!/usr/bin/env chicken-scheme

(use sicp-eval test)

(include "eval-let.scm")
(include "lookup-variable-value.scm")
(include "scan-out-defines.scm")

(define (eval-expression)
  (with-primitive-procedures `((+ ,+))
    (lambda (env)
      (eval* '(let ((a 1))
                (define (f x)
                  (define b (+ a x))
                  (define a 5)
                  (+ a b))
                (f 10))
             env))))

;;; This is the default implementation of make-procedure.
(define (make-procedure parameters body env)
  (list 'procedure parameters body env))

(test "Sequential scope" 16 (eval-expression))

;;; This implementation of make-procedure activates the
;;; define--out-scanning.
(define (make-procedure parameters body env)
  (list 'procedure parameters (scan-out-defines body) env))

(test-error "Simultaneous scope" (eval-expression))

;;; This implementation of make-procedure activates the
;;; alternative define--out-scanning.
(define (make-procedure parameters body env)
  (list 'procedure parameters (scan-out-defines-alternatively body) env))

(test-error "Alternative simultaneous scope" (eval-expression))
