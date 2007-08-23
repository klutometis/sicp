(define append!-machine
  (make-machine
   '(x y cdr-x last-x)
   `((set-cdr! ,set-cdr!) (cdr ,cdr) (null? ,null?))
   '((assign last-x (reg x))
     loop
     (assign cdr-x (op cdr) (reg last-x))
     (test (op null?) (reg cdr-x))
     (branch (label done))
     (assign last-x (reg cdr-x))
     (goto (label loop))
     done
     (perform (op set-cdr!) (reg last-x) (reg y)))))
