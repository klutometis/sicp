#!/usr/bin/env chicken-scheme
(use sicp sicp-eval test)

(include "data-directed-eval.scm")

(define (eval-and exp env)
  (let iter ((exps (operands exp))
             (last (eval* 'true env)))
    (if (null? exps)
        last
        (let ((value (eval* (first-operand exps) env)))
          (if value
              (iter (rest-operands exps) value)
              (eval* 'false env))))))

(put 'eval 'and eval-and)

(define (eval-or exp env)
  (let iter ((exps (operands exp)))
    (if (null? exps)
        (eval* 'false env)
        (or (eval* (first-operand exps) env)
            (iter (rest-operands exps))))))

(put 'eval 'or eval-or)

(with-primitive-procedures `((= ,=))
  (lambda (env)
    (test-assert (not (eval* '(and true false) env)))
    (test-assert (eval* '(and) env))
    (test-assert (eval* '(and true true) env))
    (test 2 (eval* '(and true 2) env))

    (test-assert (not (eval* '(or) env)))
    (test-assert (eval* '(or false true) env))
    (test 2 (eval* '(or 2 true) env))))
