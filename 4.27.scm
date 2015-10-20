#!/usr/bin/env chicken-scheme
(use sicp-eval sicp-eval-lazy test)

(with-primitive-procedures `((+ ,+)
                             (values ,values))
  (lambda (env)
    (eval* '(define count 0) env)
    (eval* '(define (id x) (set! count (+ count 1)) x) env)
    (eval* '(define w (id (id 10))) env)
    (test "Id has been called once." 1 (eval* 'count env))
    ;; Have to force the evaluation of w with values?
    (test "W is 10." 10 (eval* '(values w) env))
    (test "Id has been called twice." 2 (eval* 'count env))))
