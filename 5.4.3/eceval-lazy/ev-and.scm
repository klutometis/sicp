;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define ev-and
  '(ev-and
    (assign exp (op and->if) (reg exp))
    (goto (label eval-dispatch))))
