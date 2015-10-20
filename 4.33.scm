#!/usr/bin/env chicken-scheme
(use debug sicp-eval sicp-eval-lazy test)

(with-lazy-lists '()
  (lambda (env)
    (test-error "Taking the car of the lazy-list errors out."
                (eval* '(car '(a b c)) env))))

(define (maybe-lazy-list exp env)
  (if (not (pair? exp))
      exp
      (eval* `(lambda (m) (m ',(car exp) ,(maybe-lazy-list (cdr exp) env))) env)))

(define (eval* exp env)
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ;; This is the only line of the evaluator we modified.
        ((quoted? exp) (maybe-lazy-list (text-of-quotation exp) env))
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
         (apply* (actual-value (operator exp) env)
                      (operands exp)
                      env))
        (else
         (error "Unknown expression type: EVAL*" exp))))

(with-lazy-lists `((values ,values))
  (lambda (env)
    (test "Now we can take the car of the lazy-list."
          'a
          (eval* '(values (car '(a b c))) env))))
