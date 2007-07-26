(load "stream-map.scm")

(define (invert-stream s)
  (stream-map (lambda (x) (/ 1 x)) s))
