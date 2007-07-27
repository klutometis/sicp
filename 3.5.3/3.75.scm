(load "test.scm")
(load "make-zero-crossings.scm")
(load "sense-data.scm")
(load "display-stream.scm")
(load "zero-crossings.scm")

(define noisy-signal (stream 1 -.001 .1 -.001 .1 -1 -2))
(define dampened-crossings (stream->list (make-zero-crossings noisy-signal 0 0)))

(test
 "zero-crossings on average-dampened input source"
 '(0 0 0 0 0 0 -1)
 dampened-crossings
 'equal?
 equal?)
