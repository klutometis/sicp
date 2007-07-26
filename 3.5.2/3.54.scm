(load "integers.scm")
(load "ones.scm")
(load "add-streams.scm")
(load "mul-streams.scm")
(load "display-stream-n.scm")

(define factorials (cons-stream 1 (mul-streams factorials (add-streams ones integers))))
(display-stream-n factorials 10)
