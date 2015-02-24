#!/usr/bin/env chicken-scheme

(use sicp-eval test)

(include "data-directed-eval.scm")
(include "env-loop+scan.scm")

(define (make-unbound-variable exp) (cadr exp))

(define (make-unbound! exp env)
  (let ((var (make-unbound-variable exp)))
    (env-loop
     env
     var
     (lambda (vars vals)
       )
     (lambda () (error "Unbound variable: MAKE-UNBOUND!" var)))))

(put 'eval 'make-unbound! make-unbound!)

(with-primitive-procedures `((* ,*))
  (lambda (env)
    (eval* '(define x 3) env)
    (eval* '(make-unbound! x) env)
    ;; It should be an error to use x.
    (test-error (eval* '(* x x) env))
    ;; It should be an error to try to unbind it again.
    (test-error (eval* '(make-unbound! x) env))))
