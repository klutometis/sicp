(load "register-machine-context.scm")
(load "test-context.scm")
(load "register-machine/make-new-machine-trace.scm")
(load "register-machine/fib-machine.scm")

(fib-machine 'trace-on)
(set-register-contents! fib-machine 'n 1)
(define trace
  (with-output-to-string
    (lambda () (start fib-machine))))

(test
 "trace of fib-1"
 "(assign continue (label fib-done))\n(test (op <) (reg n) (const 2))\n(branch (label immediate-answer))\n(assign val (reg n))\n(goto (reg continue))\n"
 trace
 'string=? string=?)
