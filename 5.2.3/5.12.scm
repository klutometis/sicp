(load "register-machine-context.scm")
(load "test-context.scm")

(load "register-machine/assemble-stats.scm")
(load "register-machine/make-assign-stats.scm")
(load "register-machine/make-execution-procedure-stats.scm")
(load "register-machine/make-new-machine-stats.scm")
(load "register-machine/make-restore-stats.scm")
(load "register-machine/make-save-stats.scm")

(load "register-machine/fib-machine.scm")

(set-register-contents! fib-machine 'n 5)
(start fib-machine)
(define insts (fib-machine 'insts))
(define entry-points (fib-machine 'entry-points))
(define saved/restored-regs (fib-machine 'saved/restored-regs))
(define assignment-sources (fib-machine 'assignment-sources))

(test
 "instructions"
 '((test (op <) (reg n) (const 2)) (save continue) (save n) (save val) (restore n) (restore continue) (restore val) (goto (label fib-loop)) (goto (reg continue)) (branch (label immediate-answer)) (assign continue (label fib-done)) (assign continue (label afterfib-n-1)) (assign n (op -) (reg n) (const 1)) (assign n (op -) (reg n) (const 2)) (assign continue (label afterfib-n-2)) (assign n (reg val)) (assign val (op +) (reg val) (reg n)) (assign val (reg n)))
 insts
 'equal? equal?)

(test
 "entry points"
 '(fib fib-loop afterfib-n-1 afterfib-n-2 immediate-answer fib-done)
 entry-points
 'equal? equal?)

(test
 "saved/restored registers"
 '(continue n val)
 saved/restored-regs
 'equal? equal?)

(test
 "assignment sources"
 '((n ((reg val)) ((op -) (reg n) (const 2)) ((op -) (reg n) (const 1))) (val ((op +) (reg val) (reg n)) ((reg n))) (continue ((label afterfib-n-2)) ((label afterfib-n-1)) ((label fib-done))))
 assignment-sources
 'equal? equal?)
