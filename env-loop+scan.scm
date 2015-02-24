#!/usr/bin/env chicken-scheme

(define (scan vars vals var finally equally)
  (cond ((null? vars) (finally))
        ((eq? var (car vars)) (equally vars vals))
        (else (scan (cdr vars) (cdr vals) var finally equally))))

(define (env-loop env var equally fail)
  (if (eq? env the-empty-environment)
      (fail)
      (let ((frame (first-frame env)))
        (scan (frame-variables frame)
              (frame-values frame)
              var
              (lambda ()
                (env-loop (enclosing-environment env) var equally fail))
              equally))))
