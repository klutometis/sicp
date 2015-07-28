#!/usr/bin/env chicken-scheme

(use debug sicp sicp-eval sicp-eval-amb test)

(define (require? exp) (tagged-list? exp 'require))

(define (require-predicate exp) (cadr exp))

(define (analyze-require exp)
  (let ((pproc (analyze (require-predicate exp))))
    (lambda (env succeed fail)
      (pproc env
             (lambda (pred-value fail2)
               (if (false? pred-value)
                   (fail2)
                   (succeed 'ok fail2)))
             fail))))

(define (analyze exp)
  (cond ((self-evaluating? exp) (analyze-self-evaluating exp))
        ((quoted? exp) (analyze-quoted exp))
        ((variable? exp) (analyze-variable exp))
        ((assignment? exp) (analyze-assignment exp))
        ((definition? exp) (analyze-definition exp))
        ((let-clause? exp) (analyze-let exp))
        ((if? exp) (analyze-if exp))
        ((lambda? exp) (analyze-lambda exp))
        ((begin? exp) (analyze-sequence (begin-actions exp)))
        ((cond? exp) (analyze (cond->if exp)))
        ((amb? exp) (analyze-amb exp))
        ((require? exp) (analyze-require exp))
        ((application? exp) (analyze-application exp))
        (else (error "Unknown expression type: ANALYZE" exp))))

(with-primitive-procedures `((not ,not))
  (lambda (env)
    (ambeval* '(define (an-element-of items)
                 (require (not (null? items)))
                 (amb (car items) (an-element-of (cdr items))))
              env)
    (test
     "Built-in require"
     '(1 2 3)
     (ambeval* '(an-element-of '(1 2 3)) env))))
