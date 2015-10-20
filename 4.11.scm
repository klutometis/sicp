#!/usr/bin/env chicken-scheme
(use debug sicp-eval srfi-69 test)

(define (zip-alist keys values)
  (map cons keys values))

(define (make-frame vars vals)
  (alist->hash-table (zip-alist vars vals)))
(define (frame-variables frame)
  (hash-table-keys frame))
(define (frame-values frame)
  (hash-table-values frame))
(define (add-binding-to-frame! var val frame)
  (hash-table-set! frame var val))

(with-primitive-procedures `((* ,*))
  (lambda (env)
    (eval* '(define x 3) env)
    (test 9 (eval* '(* x x) env))))
