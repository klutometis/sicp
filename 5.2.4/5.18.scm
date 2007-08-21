(load "register-machine-context.scm")
(load "test-context.scm")
(load "register-machine/make-new-machine-trace-reg.scm")
(load "register-machine/make-register-trace-reg.scm")
(load "register-machine/fib-machine.scm")

(set-register-contents! fib-machine 'n 3)
((fib-machine 'trace-reg-on) 'n)
(define reg-trace
  (with-output-to-string
    (lambda ()
      (start fib-machine))))

reg-trace

(test
 "tracing of individual vars"
 "n: 3 -> 2\nn: 2 -> 1\nn: 1 -> 2\nn: 2 -> 0\nn: 0 -> 0\nn: 0 -> 3\nn: 3 -> 1\nn: 1 -> 1\n"
 reg-trace
 'string=? string=?)
