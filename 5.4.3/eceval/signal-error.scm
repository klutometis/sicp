;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define signal-error
  '(signal-error
    (perform (op user-print) (reg val))
    (goto (label read-eval-print-loop))))
