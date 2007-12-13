;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "register-machine-context.scm")
(load "test-context.scm")
(load "register-machine/make-new-machine-trace-label-break.scm")
(load "register-machine/make-goto-trace-label.scm")
(load "register-machine/make-branch-trace-label.scm")
(load "register-machine/assemble-trace-label.scm")
(load "register-machine/gcd-machine.scm")

;;; In the middle of the (gcd 206 40) problem, turn it into a
;;; different one.
(set-register-contents! gcd-machine 'a 206)
(set-register-contents! gcd-machine 'b 40)
((gcd-machine 'set-breakpoint) 'test-b 4)
(start gcd-machine)
(get-register-contents gcd-machine 'a)
((gcd-machine 'proceed))
(get-register-contents gcd-machine 'a)
(get-register-contents gcd-machine 'b)
;;; Turn it into a (gcd 16 4) problem.
(set-register-contents! gcd-machine 'b 16)
;;; Turn off the breakpoint
((gcd-machine 'cancel-breakpoint) 'test-b)
((gcd-machine 'proceed))
(define gcd-16-4
  (get-register-contents gcd-machine 'a))


(test
 "mutated (gcd 16 4) problem"
 4
 gcd-16-4
 '= =)
