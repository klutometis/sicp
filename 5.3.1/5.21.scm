;;; TODO: reimplement in terms of vector-ref and vector-set!

(load "register-machine-context.scm")
(load "test-context.scm")
(load "register-machine/count-leaves-recursive.scm")
(load "register-machine/count-leaves-iterative.scm")

(define tree '((1 2) 3 4 (5 6 7 (2 3))))

(set-register-contents! count-leaves-recursive 'tree tree)
(start count-leaves-recursive)
(define recursive
  (get-register-contents count-leaves-recursive 'val))

(set-register-contents! count-leaves-iterative 'tree tree)
(start count-leaves-iterative)
(define iterative
  (get-register-contents count-leaves-iterative 'val))

(test
 "recursive-count is correct"
 9
 recursive
 '= =)

(test
 "recursive and iterative issue identically"
 recursive
 iterative
 '= =)
