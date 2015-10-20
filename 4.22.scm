#!/usr/bin/env chicken-scheme
(use sicp-eval sicp-eval-anal test)

(define (let-clause? exp) (tagged-list? exp 'let))
(define (let-clauses exp) (cadr exp))
(define (let-clause-variable clause) (car clause))
(define (let-clause-expression clause) (cadr clause))
(define (let-body exp) (cddr exp))

(define (let->combination exp)
  (let ((clauses (let-clauses exp)))
    (let ((variables (map let-clause-variable clauses))
          (expressions (map let-clause-expression clauses)))
      `((lambda ,variables ,@(let-body exp)) ,@expressions))))

(define (analyze-let exp)
  (let ((combination (let->combination exp)))
    (analyze combination)))

(define (analyze exp)
  (cond ((self-evaluating? exp) (analyze-self-evaluating exp))
        ((quoted? exp) (analyze-quoted exp))
        ((variable? exp) (analyze-variable exp))
        ((definition? exp) (analyze-assignment exp))
        ;; TODO: A generic syntactic-transformation form instead of
        ;; this ad-hocery?
        ((let-clause? exp) (analyze-let exp))
        ((if? exp) (analyze-if exp))
        ((lambda? exp) (analyze-lambda exp))
        ((begin? exp) (analyze-sequence (begin-actions exp)))
        ((cond? exp) (analyze (cond->if exp)))
        ((application? exp) (analyze-application exp))
        (else (error "Unknown expression type: ANALYZE" exp))))

(with-primitive-procedures `((+ ,+))
  (lambda (env)
    (test "Analyzing let" 4 (anal-eval* '(let ((x 2)) (+ x x)) env))))
