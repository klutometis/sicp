(load "test.scm")
(load "eval-global.scm")
(load "eval-call.scm")

(trace eval-assignment)
(eval-global '(define x 3))
(define application (eval-global '(call + x x)))

(test
 "application before assignment"
 6
 application
 '=
 =)
