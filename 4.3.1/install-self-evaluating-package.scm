(load "put.scm")

(define (install-self-evaluating-package)
  (define (analyze-self-evaluating exp)
    (lambda (env succeed fail)
      (succeed exp fail)))
  (put 'self-evaluating analyze-self-evaluating)
  'done)

