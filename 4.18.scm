#!/usr/bin/env chicken-scheme
(use sicp-eval test)

(include "data-directed-eval.scm")
(include "force-and-delay.scm")
(include "eval-let.scm")
(include "lookup-variable-value.scm")
(include "scan-out-defines.scm")
(include "scan-out-defines-alternatively.scm")

(define (eval-mutual-recursion)
  (with-primitive-procedures '()
    (lambda (env)
      (eval* '(define (x)
                (define y (delay dy))
                (define dy y)
                ;; This force simulates the evaluation by stream-map when
                ;; the second element is consumed; but before calculating
                ;; the second element of the integral.
                (force y)) env)
      (eval* '(x) env))))

(define (make-procedure parameters body env)
  (list 'procedure parameters (scan-out-defines body) env))

(test-assert "Delayed mutual recursion with scan-out-defines"
             (compound-procedure? (eval-mutual-recursion)))

(define (make-procedure parameters body env)
  (list 'procedure parameters (scan-out-defines-alternatively body) env))

(with-primitive-procedures `((- ,-) (= ,=))
  (lambda (env)
    (eval* '(define (f x)
              (define (even? n) (if (= n 0) true (odd? (- n 1))))
              (define (odd? n) (if (= n 0) false (even? (- n 1))))
              (odd? x))
           env)
    (test-assert "Mutual recursion with alternative scan-out-defines"
                 (not (eval* '(f 2) env)))))

(test-error "Delayed mutual recursion with alternative scan-out-defines is unassigned"
            (eval-mutual-recursion))
