;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define ev-quoted
  '(ev-quoted
    (assign val (op text-of-quotation) (reg exp))
    (goto (reg continue))))
