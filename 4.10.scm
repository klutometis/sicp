#!/usr/bin/env chicken-scheme
(use sicp-eval srfi-1 test)

(define (operator exp) (last exp))
(define (operands exp) (drop-right exp 1))

(with-primitive-procedures `((+ ,+))
  (lambda (env) (test 4 (eval* '(2 2 +) env))))
