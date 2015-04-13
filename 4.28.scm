#!/usr/bin/env chicken-scheme

(use sicp-eval test)

(include "lazy-eval.scm")

(with-primitive-procedures `()
  (lambda (env)
    (test "Apply* with a delayed procedure and actual-value works." 3
          (eval* '((lambda (x) (x)) (lambda () 3)) env))))

(define (eval* exp env)
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((quoted? exp) (text-of-quotation exp))
        ((assignment? exp) (eval-assignment exp env))
        ((definition? exp) (eval-definition exp env))
        ((if? exp) (eval-if exp env))
        ((lambda? exp) (make-procedure (lambda-parameters exp)
                                  (lambda-body exp)
                                  env))
        ((begin? exp)
         (eval-sequence (begin-actions exp) env))
        ((cond? exp) (eval* (cond->if exp) env))
        ((application? exp)
         (apply* (eval* (operator exp) env)
                 (operands exp)
                 env))
        (else
         (error "Unknown expression type: EVAL*" exp))))

(with-primitive-procedures `()
  (lambda (env)
    (test-error "Apply* with a delayed procedure and eval* errors out."
                (eval* '((lambda (x) (x)) (lambda () 3)) env))))
