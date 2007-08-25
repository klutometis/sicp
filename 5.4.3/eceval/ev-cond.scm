(define ev-cond
  '(ev-cond
    (assign exp (op cond->if) (reg exp))
    (goto (label eval-dispatch))))
