(load "register-machine-context.scm")
(load "test-context.scm")
(load "register-machine/make-new-machine-trace-label.scm")
(load "register-machine/make-goto-trace-label.scm")
(load "register-machine/make-branch-trace-label.scm")
(load "register-machine/assemble-trace-label.scm")
(load "register-machine/fib-machine.scm")

(set-register-contents! fib-machine 'n 2)
(fib-machine 'trace-on)

(define label-trace
  (with-output-to-string
    (lambda ()
      (start fib-machine))))

(test
 "labels with traced instructions"
 "fib: (assign continue (label fib-done))\nfib: (test (op <) (reg n) (const 2))\nfib: (branch (label immediate-answer))\nimmediate-answer: (save continue)\nimmediate-answer: (assign continue (label afterfib-n-1))\nimmediate-answer: (save n)\nimmediate-answer: (assign n (op -) (reg n) (const 1))\nimmediate-answer: (goto (label fib-loop))\nfib-loop: (test (op <) (reg n) (const 2))\nfib-loop: (branch (label immediate-answer))\nimmediate-answer: (assign val (reg n))\nimmediate-answer: (goto (reg continue))\nafterfib-n-1: (restore n)\nafterfib-n-1: (restore continue)\nafterfib-n-1: (assign n (op -) (reg n) (const 2))\nafterfib-n-1: (save continue)\nafterfib-n-1: (assign continue (label afterfib-n-2))\nafterfib-n-1: (save val)\nafterfib-n-1: (goto (label fib-loop))\nfib-loop: (test (op <) (reg n) (const 2))\nfib-loop: (branch (label immediate-answer))\nimmediate-answer: (assign val (reg n))\nimmediate-answer: (goto (reg continue))\nafterfib-n-2: (assign n (reg val))\nafterfib-n-2: (restore val)\nafterfib-n-2: (restore continue)\nafterfib-n-2: (assign val (op +) (reg val) (reg n))\nafterfib-n-2: (goto (reg continue))\n"
 label-trace
 'string=? string=?)
