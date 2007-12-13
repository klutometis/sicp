;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define ev-appl-last-arg-value
  '(ev-appl-last-arg-value
    (assign continue (label ev-appl-accum-last-arg-value))
    (goto (label actual-value))))
