;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define perform-error
  '(signal-error
    (perform (op error) (const "Error -- MCEVAL") (reg val))))
