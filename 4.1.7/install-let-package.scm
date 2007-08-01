(load "put.scm")
(load "let->combination.scm")
(load "analyze.scm")

(define (install-let-package)
  (define (analyze-let exp)
    (analyze (let->combination exp)))
  (put 'let analyze-let)
  'done)
