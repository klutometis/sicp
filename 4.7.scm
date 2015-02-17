#!/usr/bin/env chicken-scheme

(use sicp sicp-eval test)

(include "eval-let.scm")

(define (let*->nested-lets exp)
  )

(put 'eval 'let* (lambda (exp env) (eval* (let*->nested-lets exp) env)))

(parameterize ((primitive-procedures
                (cons `(+ ,+) (primitive-procedures))))
  (let ((env (setup-environment)))
    (eval* '(let* ((x 2) (y (+ x x))) (+ x y)) env)))
