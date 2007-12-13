;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "register-machine-context.scm")
(load "test-context.scm")

(load "register-machine/make-new-machine-registers.scm")
(load "register-machine/make-machine-registers.scm")
(load "register-machine/fib-machine-registers.scm")

(set-register-contents! fib-machine 'n 10)
(start fib-machine)
(define
  fib-10 (get-register-contents fib-machine 'val))

(test
 "fib 10 without specifying registers"
 55
 fib-10
 '= =)
