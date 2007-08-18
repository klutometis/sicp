(load "register-machine-context.scm")
(load "test-context.scm")

(load "register-machine/factorial-machine.scm")

(set-register-contents! factorial-machine 'n 5)
(start factorial-machine)

(define
  fact-5 (get-register-contents factorial-machine 'product))

(test
 "factorial 5 from the machine"
 120
 fact-5
 '= =)
