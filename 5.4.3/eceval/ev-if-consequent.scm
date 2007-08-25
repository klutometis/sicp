(define ev-if-consequent
  '(ev-if-consequent
    (assign exp (op if-consequent) (reg exp))
    (goto (label eval-dispatch))))
