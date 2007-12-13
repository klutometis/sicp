;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define sqrt-machine-primitive
  (make-machine
   '(guess t x)
   `((good-enough? ,good-enough?)
     (improve ,improve)
     (average ,average))
   '(sqrt
     (assign guess (const 1.0))
     (goto (label sqrt-iter))
     sqrt-iter
     (test (op good-enough?) (reg guess) (reg x))
     (branch (label sqrt-done))
     (assign t (op improve) (reg guess) (reg x))
     (assign guess (reg t))
     (goto (label sqrt-iter))
     sqrt-done)))
