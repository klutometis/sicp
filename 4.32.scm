#!/usr/bin/env chicken-scheme
(use sicp-eval sicp-eval-lazy test)

(with-lazy-lists `((+ ,+) (values ,values))
  (lambda (env)
    (eval* '(define sum 0) env)
    (eval* '(define (accum x) (set! sum (+ x sum)) sum) env)
    (eval* '(define seq (map accum (cons 1 (cons 2 (cons 3 '()))))) env)
    (test "Sum is initially 0." 0 (eval* 'sum env))
    (eval* '(values (list-ref seq 2)) env)
    (test "Sum is 3 after iterating twice." 3 (eval* 'sum env))))
