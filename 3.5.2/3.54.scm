(load "integers-starting-from.scm")
(load "mul-streams.scm")
(load "display-stream-n.scm")

(define factorials
  (cons-stream 1 (mul-streams factorials (integers-starting-from 2))))
(display-stream-n factorials 10)
