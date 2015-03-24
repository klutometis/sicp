#!/usr/bin/env chicken-scheme

(use sicp-eval srfi-1 test)

(include "eval-let.scm")
(include "lookup-variable-value.scm")
(include "scan-out-defines.scm")

(define (make-procedure parameters body env)
  (list 'procedure parameters (scan-out-defines body) env))

(with-primitive-procedures `((- ,-) (= ,=))
  (lambda (env)
    (eval* '(define (f x)
              (define (even? n) (if (= n 0) true (odd? (- n 1))))
              (define (odd? n) (if (= n 0) false (even? (- n 1))))
              (odd? x))
           env)
    (test-assert (not (eval* '(f 2) env)))))
