#!/usr/bin/env chicken-scheme

(use sicp-eval test)

(include "lazy-eval.scm")

(with-primitive-procedures `((+ ,+)
                             (= ,=)
                             (- ,-)
                             (values ,values))
  (lambda (env)
    (eval* '(define (cons x y) (lambda (m) (m x y))) env)
    (eval* '(define (car z) (z (lambda (p q) p))) env)
    (eval* '(define (cdr z) (z (lambda (p q) q))) env)
    (eval* '(define (list-ref items n)
              (if (= n 0)
                  (car items)
                  (list-ref (cdr items) (- n 1))))
           env)
    (eval* '(define (map proc items)
              (if (null? items)
                  '()
                  (cons (proc (car items)) (map proc (cdr items)))))
           env)

    (eval* '(define sum 0) env)
    (eval* '(define (accum x) (set! sum (+ x sum)) sum) env)
    (eval* '(define seq (map accum (cons 1 (cons 2 (cons 3 '()))))) env)
    (test "Sum is initially 0." 0 (eval* 'sum env))
    (eval* '(values (list-ref seq 2)) env)
    (test "Sum is 3 after iterating twice." 3 (eval* 'sum env))))
