#!/usr/bin/env chicken-scheme

(use sicp-eval test)

(include "lazy-eval.scm")

(with-primitive-procedures `((+ ,+))
  (lambda (env)
    (lazy-eval* '(define count 0) env)
    (lazy-eval* '(define (id x) (set! count (+ count 1)) x) env)
    (lazy-eval* '(define w (id (id 10))) env)
    (test 2 (lazy-eval* 'count env))
    (test 10 (lazy-eval* 'w env))
    (test 2 (lazy-eval* 'count env))))
