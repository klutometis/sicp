;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../2.2.1/section)
(import* section-2.2.1 last-pair)

(let ((list '(1 2 3 4)))
  (check (last-pair list) => '(4)))
