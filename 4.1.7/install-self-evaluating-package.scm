(load "put.scm")

(define (install-self-evaluating-package)
  (define (analyze-self-evaluating exp)
    (lambda (env) exp))
  (put 'self-evaluating analyze-self-evaluating)
  'done)

