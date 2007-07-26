(load "stream-for-each.scm")
(load "display-line.scm")

(define (display-stream s)
  (stream-for-each display-line s))
