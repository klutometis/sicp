(load "parameter-notated?.scm")

(define (strict? parameter)
  (parameter-notated? parameter 'strict))

