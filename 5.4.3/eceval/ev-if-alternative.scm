;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define ev-if-alternative
  '(ev-if-alternative
    (assign exp (op if-alternative) (reg exp))
    (goto (label eval-dispatch))))
