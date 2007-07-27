(load "make-tableau.scm")

(define (accelerated-sequence transform s)
  (stream-map stream-car
              (make-tableau transform s)))
