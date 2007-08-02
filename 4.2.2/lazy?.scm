(load "parameter-notated?.scm")

(define (lazy? parameter)
  (parameter-notated? parameter 'lazy))
