(define ev-let*
  '(ev-let*
    (assign exp (op let*->nested-lets) (reg exp))
    (goto (label eval-dispatch))))
