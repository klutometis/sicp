;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension check)

(check (cadadr (cdr '(1 3 (5 7) 9))) => 7)
(check (caar '((7))) => 7)
(check (cadadr (cadadr (cadadr '(1 (2 (3 (4 (5 (6 7)))))))))
       => 7)
