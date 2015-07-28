#!/usr/bin/env chicken-scheme

(use debug sicp sicp-eval sicp-eval-amb test)

(define (if-fail? exp) (tagged-list? exp 'if-fail))

(define (analyze-if-fail exp)
  (let ((pproc (analyze (if-predicate exp)))
        (cproc (analyze (if-consequent exp))))
    (lambda (env succeed fail)
      (debug (if-consequent exp))
      (pproc env
             (lambda (pred-value fail2)
               pred-value)
             ;; Why do we have to car here?
             (lambda () (car (cproc env succeed fail)))))))

(define (analyze exp)
  (cond ((self-evaluating? exp) (analyze-self-evaluating exp))
        ((quoted? exp) (analyze-quoted exp))
        ((variable? exp) (analyze-variable exp))
        ((assignment? exp) (analyze-assignment exp))
        ((definition? exp) (analyze-definition exp))
        ((let-clause? exp) (analyze-let exp))
        ((if? exp) (analyze-if exp))
        ((if-fail? exp) (analyze-if-fail exp))
        ((lambda? exp) (analyze-lambda exp))
        ((begin? exp) (analyze-sequence (begin-actions exp)))
        ((cond? exp) (analyze (cond->if exp)))
        ((amb? exp) (analyze-amb exp))
        ((application? exp) (analyze-application exp))
        (else (error "Unknown expression type: ANALYZE" exp))))

(with-require `((even? ,even?))
  (lambda (env)
    (test "Failing if-fail"
          'all-odd
          (ambeval* '(if-fail
                      (let ((x (an-element-of '(1 3 5))))
                        (require (even? x))
                        x)
                      'all-odd) env 1))
    (test "Succeeding if-fail"
          8
          (ambeval* '(if-fail
                      (let ((x (an-element-of '(1 3 5 8))))
                        (require (even? x))
                        x)
                      'all-odd) env 1))))
