;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define unknown-procedure-type
  '(unknown-procedure-type
    (restore continue)
    (assign val (const unknown-procedure-type-error))
    (goto (label signal-error))))
