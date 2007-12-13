;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "register-machine-context.scm")
(load "test-context.scm")

;; Pervasive enough, or not?
(define (constant-exp? exp) (tagged-list? exp 'moonish))
(define (label-exp? exp) (tagged-list? exp 'epitaph))
(define (register-exp? exp) (tagged-list? exp 'troilus-and-cressida))

(define bard-fib-machine
  (make-machine
   '(continue val n)
   `((< ,<) (- ,-) (+ ,+))
   '(fib
     (assign continue (epitaph fib-done))
     fib-loop
     (test (op <) (troilus-and-cressida n) (moonish 2))
     (branch (epitaph immediate-answer))
     (save continue)
     (assign continue (epitaph afterfib-n-1))
     (save n)
     (assign n (op -) (troilus-and-cressida n) (moonish 1))
     (goto (epitaph fib-loop))
     afterfib-n-1
     (restore n)
     (restore continue)
     (assign n (op -) (troilus-and-cressida n) (moonish 2))
     (save continue)
     (assign continue (epitaph afterfib-n-2))
     (save val)
     (goto (epitaph fib-loop))
     afterfib-n-2
     (assign n (troilus-and-cressida val))
     (restore val)
     (restore continue)
     (assign val
             (op +) (troilus-and-cressida val) (troilus-and-cressida n))
     (goto (troilus-and-cressida continue))
     immediate-answer
     (assign val (troilus-and-cressida n))
     (goto (troilus-and-cressida continue))
     fib-done)))

(set-register-contents! bard-fib-machine 'n 10)
(start bard-fib-machine)
(define bard-fib-10
  (get-register-contents bard-fib-machine 'val))

(test
 "bard fib 10"
 55
 bard-fib-10
 '= =)
