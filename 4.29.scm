#!/usr/bin/env chicken-scheme

(use sicp sicp-eval sicp-eval-lazy test)

(define (test-interaction name expected-value)
  (with-primitive-procedures `((+ ,+)
                               (* ,*))
    (lambda (env)
      (eval* '(define (square x) (* x x)) env)
      (eval* '(define count 0) env)
      (eval* '(define (id x) (set! count (+ count 1)) x) env)
      (eval* '(square (id 10)) env)
      (test name expected-value (eval* 'count env)))))

(define (fib n)
  (with-primitive-procedures `((+ ,+)
                               (- ,-)
                               (= ,=))
    (lambda (env)
      (eval* '(define (fib n)
                (cond ((= n 0) 0)
                      ((= n 1) 1)
                      (else (+ (fib (- n 1))
                               (fib (- n 2))))))
             env)
      (eval* `(fib ,n) env))))

(test-interaction "With memoization, count is 1." 1)
(define memoized-fib (time+values (fib 15)))

(define (force-it obj)
  (if (thunk? obj)
      (actual-value (thunk-exp obj) (thunk-env obj))
      obj))

(test-interaction "Without memoization, count is 2." 2)
(define non-memoized-fib (time+values (fib 15)))

(test-assert "Memoized-fib is quicker than non-memoized-fib." (< memoized-fib non-memoized-fib))
