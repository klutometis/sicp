#!/usr/bin/env chicken-scheme

(use debug sicp-eval test)

(include "lazy-lists.scm")

(with-lazy-lists '()
  (lambda (env)
    (test-error "Taking the car of the lazy-list errors out."
                (eval* '(car '(a b c)) env))))

(define (maybe-lazy-list exp env)
  (if (not (pair? exp))
      exp
      `(lazy-pair ,(eval* `(lambda (m) (m ',(car exp) ,(maybe-lazy-list (cdr exp) env))) env))))

(define (lazy-pair? exp) (tagged-list? exp 'lazy-pair))

(define (lazy-pair exp) (cadr exp))

(define (apply* procedure arguments env)
  (cond ((primitive-procedure? procedure)
         (apply-primitive-procedure
          procedure
          (list-of-arg-values arguments env)))
        ((compound-procedure? procedure)
         (eval-sequence
          (procedure-body procedure)
          (extend-environment
           (procedure-parameters procedure)
           (list-of-delayed-args arguments env)
           (procedure-environment procedure))))
        ((lazy-pair? procedure)
         (apply* (lazy-pair procedure) arguments env))
        (else (error "Unknown procedure type: APPLY*"
                     procedure))))

(define (eval* exp env)
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
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

(define lazy-car (compose cadr car procedure-body))

(define lazy-cdr (compose caddr car procedure-body))

(define (lazy-list->list lazy-list env)
  (if (null? lazy-list)
      '()
      (let ((pair (lazy-pair lazy-list)))
        (cons (actual-value (lazy-car pair) env)
              (lazy-list->list (lazy-cdr pair) env)))))

(define (user-print object env)
  (cond ((compound-procedure? object)
         (display (list 'compound-procedure
                        (procedure-parameters object)
                        (procedure-body object)
                        '<procedure-env>)))
        ((lazy-pair? object)
         (display (lazy-list->list object env)))
        (else (display object))))

(with-lazy-lists `((values ,values) (display ,display))
  (lambda (env)
    (test "Take the car of the type-tagged lazy-list."
          'a
          (eval* '(values (car '(a b c))) env))
    (test "Print the lazy-list."
          "(a b c)"
          (with-output-to-string
            (lambda ()
              (user-print (eval* ''(a b c) env) env))))))
