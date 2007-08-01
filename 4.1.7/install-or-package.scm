(load "put.scm")
(load "or->if.scm")
(load "analyze.scm")

(define (install-or-package)
  (define (analyze-or exp)
    (analyze (or->if exp)))
  (put 'or analyze-or)
  'done)
