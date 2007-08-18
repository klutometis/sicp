(load "register-machine-context.scm")
(load "register-machine/expt-recursive.scm")
(load "register-machine/expt-iterative.scm")
(load "test-context.scm")

(set-register-contents! expt-recursive 'b 2)
(set-register-contents! expt-recursive 'n 8)
(start expt-recursive)
(define 2^8-recursive
  (get-register-contents expt-recursive 'val))

(set-register-contents! expt-iterative 'b 2)
(set-register-contents! expt-iterative 'n 8)
(start expt-iterative)
(define 2^8-iterative
  (get-register-contents expt-iterative 'product))

(test
 "recursive 2^8 is correct"
 256
 2^8-recursive
 '= =)

(test
 "recursive 2^8 and iterative 2^8 give the same result"
 2^8-recursive
 2^8-iterative
 '= =)
