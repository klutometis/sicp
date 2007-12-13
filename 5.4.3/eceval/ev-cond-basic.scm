;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define ev-cond
  '(ev-cond
    (assign unev (op cond-clauses) (reg exp))
    ev-cond-loop
    (test (op null?) (reg unev))
    (branch (label ev-cond-null))
    (assign exp (op car) (reg unev))
    (test (op cond-else-clause?) (reg exp))
    (branch (label ev-cond-else))
    (save unev)
    (save env)
    (save continue)
    (assign exp (op cond-predicate) (reg exp))
    (assign continue (label ev-cond-after))
    (goto (label eval-dispatch))
    ev-cond-null
    (assign val (const false))
    (goto (reg continue))
    ev-cond-else
    (assign unev (op cond-actions) (reg exp))
    (save continue)
    (goto (label ev-sequence))
    ev-cond-after
    (restore continue)
    (restore env)
    (restore unev)
    (test (op true?) (reg val))
    (branch (label ev-cond-true))
    (assign unev (op cdr) (reg unev))
    (goto (label ev-cond-loop))
    ev-cond-true
    (assign exp (op car) (reg unev))
    (assign unev (op cond-actions) (reg exp))
    (save continue)
    (goto (label ev-sequence))))
