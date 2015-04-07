#!/usr/bin/env chicken-scheme

(use sicp-eval test)

(include "analyze.scm")

(with-primitive-procedures `((- ,-)
                             (= ,=))
  (lambda (env)
    (eval* '(define (iter x) (if (= x 0) x (iter (- x 1)))) env)
    (time (eval* '(iter 10000) env))))

(with-primitive-procedures `((- ,-)
                             (= ,=))
  (lambda (env)
    (anal-eval* '(define (iter x) (if (= x 0) x (iter (- x 1)))) env)
    (time (anal-eval* '(iter 10000) env))))
