(define count-leaves-recursive
  (make-machine
   '(continue val cdr-val tree)
   `((cons ,cons)
     (car ,car)
     (cdr ,cdr)
     (= ,=)
     (+ ,+)
     (pair? ,pair?)
     (null? ,null?)
     (symbol? ,symbol?)
     (number? ,number?)
     (eq? ,eq?))
   '(count-leaves
     (assign continue (label count-done))
     count-loop
     (test (op null?) (reg tree))
     (branch (label null-tree))
     (test (op pair?) (reg tree))
     (branch (label pair-tree))
     (goto (label singleton-tree))
     null-tree
     (assign val (const 0))
     (goto (reg continue))
     singleton-tree
     (assign val (const 1))
     (goto (reg continue))
     pair-tree
     (save continue)
     (assign continue (label car-tree))
     (save tree)
     (assign tree (op car) (reg tree))
     (goto (label count-loop))
     car-tree
     (restore tree)
     (restore continue)
     (assign tree (op cdr) (reg tree))
     (save continue)
     (assign continue (label cdr-tree))
     (save val)
     (goto (label count-loop))
     cdr-tree
     (assign cdr-val (reg val))
     (restore val)
     (restore continue)
     (assign val (op +) (reg val) (reg cdr-val))
     (goto (reg continue))
     count-done)))
