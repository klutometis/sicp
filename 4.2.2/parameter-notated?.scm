(load "notated-parameter-notation.scm")

(define (parameter-notated? parameter notation)
  (eq? (notated-parameter-notation parameter) notation))

