(load "put.scm")
(load "cond->if.scm")
(load "analyze.scm")

(define (install-cond-package)
  (define (analyze-cond exp)
    (analyze (cond->if exp)))
  (put 'cond analyze-cond)
  'done)
