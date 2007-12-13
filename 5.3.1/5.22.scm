;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;;; TODO: reimplement in terms of vector-ref and vector-set!

(load "register-machine-debug-context.scm")
(load "register-machine/append-machine.scm")
(load "register-machine/append!-machine.scm")

(define x '(1 2))
(define y '(3 4))

(set-register-contents! append-machine 'x x)
(set-register-contents! append-machine 'y y)
(start append-machine)
(get-register-contents append-machine 'y)

(set-register-contents! append!-machine 'x x)
(set-register-contents! append!-machine 'y y)
(start append!-machine)
(get-register-contents append!-machine 'x)
