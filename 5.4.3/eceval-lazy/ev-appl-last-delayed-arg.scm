;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define ev-appl-last-delayed-arg
  '(ev-appl-last-delayed-arg
    (assign continue (label ev-appl-accum-last-delayed-arg))
    (goto (label delay-it))))
