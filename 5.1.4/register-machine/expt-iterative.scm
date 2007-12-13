;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define expt-iterative
  (make-machine
   '(b n counter product)
   `((* ,*) (= ,=) (- ,-))
   '(expt
     (assign product (const 1))
     (assign counter (reg n))
     expt-iter
     (test (op =) (reg counter) (const 0))
     (branch (label expt-done))
     (assign counter (op -) (reg counter) (const 1))
     (assign product (op *) (reg b) (reg product))
     (goto (label expt-iter))
     expt-done)))
