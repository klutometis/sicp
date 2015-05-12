#!/usr/bin/env chicken-scheme

(use debug sicp-eval sicp-eval-lazy test)

(define (test-for-each name)
  (with-primitive-procedures `()
    (lambda (env)
      (eval* '(define (for-each proc items)
                (if (null? items)
                    'done
                    (begin (proc (car items))
                           (for-each proc (cdr items)))))
             env)
      (eval* '(define values '()) env)
      (eval* '(for-each (lambda (x) (set! values (cons x values))) '(57 321 88)) env)
      (test name '(88 321 57) (eval* 'values env)))))

(define (test-p1-p2 p1-name p2-name p2-value)
  (with-primitive-procedures `((values ,values))
    (lambda (env)
      (eval* '(define (p1 x)
                (set! x (cons x '(2)))
                x)
             env)
      (eval* '(define (p2 x)
                (define (p e) e x)
                (p (set! x (cons x '(2)))))
             env)
      (test p1-name '(1 2) (eval* '(p1 1) env))
      (test p2-name p2-value (eval* '(values (p2 1)) env)))))

;;; This is the original eval-sequence.
(define (eval-sequence exps env)
  (cond ((last-exp? exps)
         (eval* (first-exp exps) env))
        (else
         (eval* (first-exp exps) env)
         (eval-sequence (rest-exps exps) env))))

(test-for-each "For-each with original eval-sequence works.")

(test-p1-p2
 "P1 evaluates with original eval-sequence."
 "P2 with original eval-sequence is 1."
 1)

;;; This is the new eval-sequence.
(define (eval-sequence exps env)
  (cond ((last-exp? exps) (eval* (first-exp exps) env))
        (else (actual-value (first-exp exps) env)
              (eval-sequence (rest-exps exps) env))))

(test-for-each "For-each with new eval-sequence works.")

(test-p1-p2
 "P1 evaluates with new eval-sequence."
 "P2 with new eval-sequence is (1 2)."
 '(1 2))
