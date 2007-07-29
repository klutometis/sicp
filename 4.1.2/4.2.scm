(load "eval-global.scm")
(load "eval-call.scm")

(eval-global '(define x 3))
(eval-global '(call + x x))
