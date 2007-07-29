(load "put.scm")
(load "eval-assignment.scm")

(define (install-assignment-package)
  (put 'set! (lambda (exp env) (eval-assignment exp env)))
  'done)

