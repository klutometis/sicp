#!/usr/bin/env chicken-scheme

(use sicp sicp-eval test)

(include "lazy-eval.scm")

(define (annotated-parameter? parameter annotation)
  (and (pair? parameter)
       (eq? (cadr parameter) annotation)))

(define (lazy-parameter? parameter)
  (annotated-parameter? parameter 'lazy))

(define (lazy-memo-parameter? parameter)
  (annotated-parameter? parameter 'lazy-memo))

(define (perma-delay-it exp env)
  (list 'perma-thunk exp env))

(define (list-of-possibly-delayed-args parameters exps env)
  (map (lambda (parameter exp)
         (cond ((lazy-parameter? parameter) (perma-delay-it exp env))
               ((lazy-memo-parameter? parameter) (delay-it exp env))
               (else (eval* exp env))))
       parameters exps))

(define (procedure-parameters-maybe-delayed procedure)
  (map (lambda (parameter)
         (if (symbol? parameter) parameter (car parameter)))
       (procedure-parameters procedure)))

(define (perma-thunk? obj)
  (tagged-list? obj 'perma-thunk))

(define (force-it obj)
  (cond ((perma-thunk? obj)
         (actual-value (thunk-exp obj) (thunk-env obj)))
        ((thunk? obj)
         (let ((result (actual-value (thunk-exp obj)
                                     (thunk-env obj))))
           (set-car! obj 'evaluated-thunk)
           (set-car! (cdr obj) result)
           (set-cdr! (cdr obj) '())
           result))
        ((evaluated-thunk? obj) (thunk-value obj))
        (else obj)))

(define (apply* procedure arguments env)
  (cond ((primitive-procedure? procedure)
         (apply-primitive-procedure
          procedure
          (list-of-arg-values arguments env)))
        ((compound-procedure? procedure)
         (eval-sequence
          (procedure-body procedure)
          (extend-environment
           (procedure-parameters-maybe-delayed procedure)
           (list-of-possibly-delayed-args
            (procedure-parameters procedure)
            arguments
            env)
           (procedure-environment procedure))))
        (else (error "Unknown procedure type: APPLY*"
                     procedure))))

(with-primitive-procedures `((= ,=))
  (lambda (env)
    (eval* '(define (p) (p)) env)
    (eval* '(define (test x (y lazy))
              (if (= x 0) 0 y)) env)
    (test "Lazy parameter" 0 (eval* '(test 0 (p)) env))))

(define (fib n-annotation n)
  (with-primitive-procedures `((+ ,+)
                               (- ,-)
                               (= ,=))
    (lambda (env)
      (eval* `(define (fib (n ,n-annotation))
                (cond ((= n 0) 0)
                      ((= n 1) 1)
                      (else (+ (fib (- n 1))
                               (fib (- n 2))))))
             env)
      (eval* `(fib ,n) env))))

(let ((n 14))
  (test-assert "Fib with lazy-memo is faster than fib with lazy"
               (> (time+values (fib 'lazy n))
                  (time+values (fib 'lazy-memo n)))))
