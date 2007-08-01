(load "put.scm")
(load "let*->nested-lets.scm")
(load "analyze.scm")

(define (install-let*-package)
  (define (analyze-let* exp)
    (analyze (let*->nested-lets exp)))
  (put 'let* analyze-let*)
  'done)
