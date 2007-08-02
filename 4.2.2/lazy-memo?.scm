(load "parameter-notated?.scm")

(define (lazy-memo? parameter)
  (parameter-notated? parameter 'lazy-memo))
