#!/usr/bin/env chicken-scheme

(use sicp-eval test)

(with-primitive-procedures `((null? ,null?)
                             (cons ,cons)
                             (car ,car)
                             (cdr ,cdr)
                             (* ,*))
  (lambda (env)
    (eval* '(define (map proc items)
              (if (null? items)
                  '()
                  (cons (proc (car items))
                        (map proc (cdr items)))))
           env)
    (test "Defining a local map works."
          '(1 4 9)
          (eval* '(map (lambda (x) (* x x)) '(1 2 3)) env))))

(with-primitive-procedures `((map ,map)
                             (* ,*))
  (lambda (env)
    (test-error "Using built-in map errors out."
                (eval* '(map (lambda (x) (* x x)) '(1 2 3)) env))))
