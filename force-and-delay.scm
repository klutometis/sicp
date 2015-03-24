#!/usr/bin/env chicken-scheme

(include "data-directed-eval.scm")
(put 'eval 'delay (lambda (exp env) (eval* `(lambda () ,(cadr exp)) env)))
(put 'eval 'force (lambda (exp env) (eval* (cdr exp) env)))
