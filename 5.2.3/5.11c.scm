;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "register-machine-context.scm")
(load "test-context.scm")
(load "register-machine/make-new-machine-stacks.scm")
(load "register-machine/make-restore-stacks.scm")
(load "register-machine/make-save-stacks.scm")

(define make-incongruous-restore
  (lambda ()
    (make-machine
     '(y x)
     '()
     '((perform (op initialize-stack))
       (assign x (const 1))
       (assign y (const 2))
       (save y)
       (save x)
       (restore y)))))

(define machine (make-incongruous-restore))
(start machine)
(define result
  (list (get-register-contents machine 'x)
        (get-register-contents machine 'y)))

(test
 "with selective popping, (1 2)"
 '(1 2)
 result
 'equal? equal?)
