(load "zero-crossings.scm")
(load "sense-data.scm")

(define crossings (stream->list (zero-crossings sense-data)))

(test
 "zero crossings (put 0 in front?)"
 '(0 0 0 0 -1 0 0 0 0 1 0 0)
 crossings
 'equal?
 equal?)
