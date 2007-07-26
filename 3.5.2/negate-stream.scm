(load "stream-map.scm")

(define (negate-stream s)
  (stream-map (lambda (x) (- x)) s))
