(load "put.scm")
(load "eval-do.scm")

(define (install-do-package)
  (define (analyze-do exp)
    (lambda (env) (eval-do exp env)))
  (put 'do analyze-do)
  'done)
