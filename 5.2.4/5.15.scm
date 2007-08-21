(load "register-machine-context.scm")
(load "test-context.scm")

(load "register-machine/make-new-machine-count.scm")
(load "register-machine/fib-machine.scm")

(set-register-contents! fib-machine 'n 5)
(start fib-machine)
(define count (fib-machine 'instruction-count))

(test
 "instruction count for fib-5"
 167
 count
 '= =)
