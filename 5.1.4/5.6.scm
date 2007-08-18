(load "register-machine-context.scm")
(load "register-machine/fib-machine.scm")
(load "register-machine/fib-machine-faster.scm")
(load "test-context.scm")

(set-register-contents! fib-machine 'n 10)
(start fib-machine)
(define fib-10
  (get-register-contents fib-machine 'val))

(set-register-contents! fib-machine-faster 'n 10)
(start fib-machine-faster)
(define fib-10-faster
  (get-register-contents fib-machine-faster 'val))

(test
 "normal machine computes fib 10 correctly (1-based)"
 55
 fib-10
 '= =)

(test
 "normal and faster machine compute the same number"
 fib-10
 fib-10-faster
 '= =)
