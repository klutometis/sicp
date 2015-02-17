#!/usr/bin/env chicken-scheme

(use sicp sicp-eval)

(include "data-directed-eval.scm")

(define (let-clauses exp) (cadr exp))
(define (let-clause-variable clause) (car clause))
(define (let-clause-expression clause) (cadr clause))
(define (let-body exp) (cddr exp))

(define (let->combination exp)
  (let ((clauses (let-clauses exp)))
    (let ((variables (map let-clause-variable clauses))
          (expressions (map let-clause-expression clauses)))
      `((lambda ,variables ,@(let-body exp)) ,@expressions))))

(put 'eval 'let (lambda (exp env) (eval* (let->combination exp) env)))
