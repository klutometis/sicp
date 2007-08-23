;;; Thanks lp_lyot; http://lre3.sblo.jp/category/277777-3.html
(define count-leaves-iterative
  (make-machine
   '(continue val tree)
   `((car ,car) (cdr ,cdr) (cons ,cons) (+ ,+) (= ,=) (null? ,null?) (pair? ,pair?))
   '(count-leaves
     (assign continue (label count-done))
     (assign val (const 0))
     count-loop
     (test (op null?) (reg tree))
     (branch (label null-tree))
     (test (op pair?) (reg tree))
     (branch (label pair-tree))
     (goto (label singleton-tree))
     singleton-tree
     (assign val (op +) (reg val) (const 1))
     (goto (reg continue))
     null-tree
     (goto (reg continue))
     pair-tree
     (save continue)
     (save tree)
     (assign tree (op car) (reg tree))
     (assign continue (label car-tree))
     (goto (label count-loop))
     car-tree
     (restore tree)
;     (restore continue)
     (assign tree (op cdr) (reg tree))
     (assign continue (label cdr-tree))
     (goto (label count-loop))
     cdr-tree
;     (restore tree)
     (restore continue)
     (goto (label count-loop))
     count-done)))
