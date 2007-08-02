(load "put.scm")
(load "delay-it-memoized.scm")

(define (install-lazy-memo-notation)
  (put 'lazy-memo delay-it-memoized)
  'done)
