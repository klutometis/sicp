#!/usr/bin/env chicken-scheme
(use sicp-eval test)

(include "eval-let.scm")

(define (named-let? exp)
  (symbol? (let-clauses exp)))

(define (named-let-procedure exp) (cadr exp))
(define (named-let-clauses exp) (caddr exp))
(define (named-let-body exp) (cdddr exp))

;;; We could really use letrec, here; let's use something similar by
;;; defining a placeholder for the procedure and setting it down
;;; below.
(define (named-let->combination exp)
  (if (named-let? exp)
      (let ((procedure (named-let-procedure exp))
            (clauses (named-let-clauses exp)))
        (let ((variables (map let-clause-variable clauses))
              (expressions (map let-clause-expression clauses)))
          `(let ((,procedure #f))
             (set! ,procedure (lambda ,variables ,@(named-let-body exp)))
             (,procedure ,@expressions))))
      (let->combination exp)))

(put 'eval 'let (lambda (exp env) (eval* (named-let->combination exp) env)))

(with-primitive-procedures `((= ,=)
                             (+ ,+)
                             (- ,-))
  (lambda (env)
    (eval* '(define (fib n)
              (let fib-iter ((a 1)
                             (b 0)
                             (count n))
                (if (= count 0)
                    b
                    (fib-iter (+ a b) a (- count 1)))))
           env)
    (test 55 (eval* '(fib 10) env))))
