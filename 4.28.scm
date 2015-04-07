#!/usr/bin/env chicken-scheme

(use sicp-eval test)

(include "lazy-eval.scm")

(define (lazy-eval* exp env)
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
        ((cond? exp) (lazy-eval* (cond->if exp) env))
        ((application? exp)
         (lazy-apply* ;; (actual-value (operator exp) env)
                      (lazy-eval* (operator exp) env)
                      (operands exp)
                      env))
        (else
         (error "Unknown expression type: EVAL" exp))))

(with-primitive-procedures `((cadr ,cadr)
                             (force-it ,force-it))
  (lambda (env)
    (lazy-eval* '((lambda (x) (x)) (lambda () 3)) env)))
