;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension check)

(let ((x (list 1 2 3))
      (y (list 4 5 6)))
 (check (append x y) => '(1 2 3 4 5 6))
 (check (cons x y) => '((1 2 3) 4 5 6))
 (check (list x y) => '((1 2 3) (4 5 6))))
