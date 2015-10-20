#!/usr/bin/env chicken-scheme
(use debug sicp sicp-eval sicp-eval-amb test)

(define (permanent-assignment? exp) (tagged-list? exp 'permanent-set!))

(define (analyze-permanent-assignment exp)
  (let ((var (assignment-variable exp))
        (vproc (analyze (assignment-value exp))))
    (lambda (env succeed fail)
      (vproc env
             (lambda (val fail2)
               (set-variable-value! var val env)
               (succeed 'ok fail2))
             fail))))

(define (if-fail? exp) (tagged-list? exp 'if-fail))

(define (analyze-if-fail exp)
  (let ((pproc (analyze (if-predicate exp)))
        (cproc (analyze (if-consequent exp))))
    (lambda (env succeed fail)
      (debug (if-consequent exp))
      (pproc env
             (lambda (pred-value fail2)
               pred-value)
             ;; TODO: Why do we have to car here?
             (lambda () (car (cproc env succeed fail)))))))

(define (analyze exp)
  (cond ((self-evaluating? exp) (analyze-self-evaluating exp))
        ((quoted? exp) (analyze-quoted exp))
        ((variable? exp) (analyze-variable exp))
        ((assignment? exp) (analyze-assignment exp))
        ((permanent-assignment? exp) (analyze-permanent-assignment exp))
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

(with-require `((prime? ,prime?)
                (list ,list)
                (+ ,+))
  (lambda (env)
    (ambeval* '(define (prime-sum-pair list1 list2)
                 (let ((a (an-element-of list1))
                       (b (an-element-of list2)))
                   (require (prime? (+ a b)))
                   (list a b))) env)
    (test
     "Aggregating prime-sum-pair with permanent-set! and if-fail"
     '((8 35) (3 110) (3 20))
     (ambeval* '(let ((pairs '()))
                  (if-fail
                   (let ((p (prime-sum-pair
                             '(1 3 5 8)
                             '(20 35 110))))
                     (permanent-set! pairs (cons p pairs))
                     (amb))
                   pairs)) env))))
