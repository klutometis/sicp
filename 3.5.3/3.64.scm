(load-option 'format)

(load "test.scm")
(load "tolerant=.scm")
(load "stream-limit.scm")
(load "sqrt-stream.scm")

(define tolerance 0.001)
(define stream-sqrt-2 (stream-limit (sqrt-stream 2.) tolerance))
(define sqrt-2 (sqrt 2))

(test
 (format #f "(sqrt 2) vs. (sqrt-stream 2) within ~A" tolerance)
 '(sqrt 2)
 sqrt-2
 stream-sqrt-2
 (format #f "(tolerant= x y ~A)" tolerance)
 (lambda (x y) (tolerant= x y tolerance)))
