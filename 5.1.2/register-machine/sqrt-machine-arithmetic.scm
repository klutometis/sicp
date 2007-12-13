;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define sqrt-machine-arithmetic
  (make-machine
   '(guess t u v w x y)
   `((abs ,abs) (< ,<) (- ,-) (/ ,/) (* ,*) (+ ,+))
   '(sqrt
     (assign guess (const 1.0))
     (goto (label sqrt-iter))
     sqrt-iter
     (assign t (op *) (reg guess) (reg guess))
     (assign u (op -) (reg t) (reg x))
     (assign v (op abs) (reg u))
     (test (op <) (reg v) (const 0.001))
     (branch (label sqrt-done))
     (assign w (op /) (reg x) (reg guess))
     (assign y (op +) (reg guess) (reg w))
     (assign guess (op /) (reg y) (const 2))
     (goto (label sqrt-iter))
     sqrt-done)))
