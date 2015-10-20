#!/usr/bin/env chicken-scheme
;;; This is a version of lookup-variable-value that knows about the
;;; special value *unassigned* for exercises 4.1{6,8}.
(define (lookup-variable-value var env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars)
             (env-loop (enclosing-environment env)))
            ((eq? var (car vars))
             ;; Check for *unassigned* here.
             (let ((val (car vals)))
               (if (eq? val '*unassigned*)
                   (error "Unassigned variable" var)
                   val)))
            (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
        (error "Unbound variable" var)
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)))))
  (env-loop env))
