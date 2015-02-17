#!/usr/bin/env chicken-scheme

(use sicp sicp-eval test)

(include "data-directed-eval.scm")

(parameterize ((primitive-procedures
                (cons `(= ,=) primitive-procedures)))
  (let ((env (setup-environment)))
    (test "Self-evaluation" 2 (eval* 2 env))
    (eval* '(define x 3) env)
    (test "Variable-lookup/definition" 3 (eval* 'x env))
    (eval* '(set! x 2) env)
    (test "Variable-lookup/assignment" 2 (eval* 'x env))
    (test "If/true" 1 (eval* '(if true 1 2) env))
    (test "If/false" 2 (eval* '(if false 1 2) env))
    (test "Lambda" 4 (eval* '((lambda (x) x) 4) env))
    (test "Begin" 5 (eval* '(begin (define y 5) y) env))
    (test "Cond" 3 (eval* '(cond ((= 3 3) 3) (else 2)) env))
    (test-assert "Application" (eval* '(= 3 3) env))))
