(load "put.scm")
(load "and->if.scm")
(load "analyze.scm")

(define (install-and-package)
  (define (analyze-and exp)
    (analyze (and->if exp)))
  (put 'and analyze-and)
  'done)
