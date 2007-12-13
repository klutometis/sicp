;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define ev-if-consequent
  '(ev-if-consequent
    (assign exp (op if-consequent) (reg exp))
    (goto (label eval-dispatch))))
