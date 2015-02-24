#!/usr/bin/env chicken-scheme

(use sicp-eval test)

(include "data-directed-eval.scm")

(define (cond-recipient-clause? clause)
  (eq? (car (cond-actions clause)) '=>))
(define (cond-recipient clause)
  (caddr clause))

(define (expand-clauses clauses env)
  (and (not (null? clauses))
       (let ((first (car clauses))
             (rest (cdr clauses)))
         (cond ((cond-else-clause? first)
                (if (null? rest)
                    (sequence->exp (cond-actions first))
                    (error "ELSE clasue isn't last: COND->IF"
                           clauses))) 
               ((cond-recipient-clause? first)
                (let ((value (eval* (cond-predicate first) env)))
                  (make-if value
                           (list (cond-recipient first) value)
                           (expand-clauses rest env))))
               (else
                (make-if (cond-predicate first)
                         (sequence->exp (cond-actions first))
                         (expand-clauses rest env)))))))

(define (cond->if exp env) (expand-clauses (cond-clauses exp) env))

(put 'eval 'cond (lambda (exp env) (eval* (cond->if exp env) env)))

(with-primitive-procedures `((+ ,+))
  (lambda (env)
    (test 4 (eval* '(cond (2 => (lambda (x) (+ x x))) (else 3)) env))))
