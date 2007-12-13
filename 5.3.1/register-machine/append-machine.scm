;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define append-machine
  (make-machine
   '(x y car-x continue)
   `((cons ,cons) (car ,car) (cdr ,cdr) (null? ,null?))
   '(append
     (assign continue (label done))
     loop
     (test (op null?) (reg x))
     (branch (label after))
     (save continue)
     (save x)
     (assign x (op cdr) (reg x))
     (assign continue (label after))
     (goto (label loop))
     after
     (restore x)
     (restore continue)
     (assign car-x (op car) (reg x))
     (assign y (op cons) (reg car-x) (reg y))
     (goto (reg continue))
     done)))
