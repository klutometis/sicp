#!/usr/bin/env chicken-scheme

(use sicp-eval srfi-1 test)

(include "eval-let.scm")

(define (lookup-variable-value var env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars)
             (env-loop (enclosing-environment env)))
            ((eq? var (car vars))
             ;; Check for *unassigned* here.
             (let ((val (car vals)))
               (if (eq? val '*unassigned*)
                   (error "Unassigned variable" var)
                   val)))
            (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
        (error "Unbound variable" var)
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)))))
  (env-loop env))

(define (scan-out-defines body)
  (call-with-values (lambda () (partition definition? body))
    (lambda (definitions body)
      (let ((bindings
             (map (lambda (definition)
                    `(,(definition-variable definition) '*unassigned*))
                  definitions))
            (sets!
             (map (lambda (definition)
                    `(set!
                      ,(definition-variable definition)
                      ,(definition-value definition)))
                  definitions)))
        ;; To avoid pathological recursion, do nothing if there are
        ;; not any internal definitions.
        (if (null? definitions)
            body
            ;; We had to add an extra list here to simulate the body.
            `((let ,bindings ,@sets! ,@body)))))))

(define (make-procedure parameters body env)
  (list 'procedure parameters (scan-out-defines body) env))

(with-primitive-procedures `((- ,-) (= ,=))
  (lambda (env)
    (eval* '(define (f x)
              (define (even? n) (if (= n 0) true (odd? (- n 1))))
              (define (odd? n) (if (= n 0) false (even? (- n 1))))
              (odd? x))
           env)
    (test-assert (not (eval* '(f 2) env)))))
