(load "zero-crossings.scm")

(define input (stream 1 2 1.5 1 0.5 -0.1 -2 -3 -2 -0.5 0.2 3 4))
(define crossings (stream->list (zero-crossings input)))

(test
 "zero crossings (put 0 in front?)"
 '(0 0 0 0 -1 0 0 0 0 1 0 0)
 crossings
 'equal?
 equal?)
