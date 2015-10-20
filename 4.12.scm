#!/usr/bin/env chicken-scheme
(use sicp-eval test)

(include "env-loop+scan.scm")

(define (lookup-variable-value var env)
  (env-loop
   env
   var
   (lambda (vars vals) (car vals))
   (lambda () (error "Unbound variable" var))))

(define (set-variable-value! var val env)
  (env-loop
   env
   var
   (lambda (vars vals) (set-car! vals val))
   (lambda () (error "Unbound variable: SET!" var))))

(define (define-variable! var val env)
  (let ((frame (first-frame env)))
    (scan (frame-variables frame)
          (frame-values frame)
          var
          (lambda () (add-binding-to-frame! var val frame))
          (lambda (vars vals) (set-car! vals val)))))

(with-primitive-procedures `((* ,*))
  (lambda (env)
    (eval* '(define x 3) env)
    (test 9 (eval* '(* x x) env))))
