(load "register-machine-context.scm")
(load "test-context.scm")

;; See TODO: redundant with 5.6?  Though that's actually two
;; instructions.
(define fib-machine
  (make-machine
   '(continue val n)
   `((< ,<) (- ,-) (+ ,+))
   '(fib
     (assign continue (label fib-done))
     fib-loop
     (test (op <) (reg n) (const 2))
     (branch (label immediate-answer))
     (save continue)
     (assign continue (label afterfib-n-1))
     (save n)
     (assign n (op -) (reg n) (const 1))
     (goto (label fib-loop))
     afterfib-n-1
     (restore n)
;     (restore continue)
     (assign n (op -) (reg n) (const 2))
;     (save continue)
     (assign continue (label afterfib-n-2))
     (save val)
     (goto (label fib-loop))
     afterfib-n-2
     (assign n (reg val))
     (restore val)
     (restore continue)
     (assign val
             (op +) (reg val) (reg n))
     (goto (reg continue))
     immediate-answer
     (assign val (reg n))
     (goto (reg continue))
     fib-done)))

(set-register-contents! fib-machine 'n 10)
(start fib-machine)
(define fib-10
  (get-register-contents fib-machine 'val))

(test
 "fibonacci with two instructions removed"
 55
 fib-10
 '= =)