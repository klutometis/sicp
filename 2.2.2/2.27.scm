;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension check)

;; Elegant Japanese solution:
(define (deep-reverse tree)
  (if (not (pair? tree))
      tree
      (reverse (map deep-reverse tree))))

(let ((tree '((1 2 (1 2 3 4)) (3 4))))
  (check (deep-reverse tree)
         => '((4 3) ((4 3 2 1) 2 1))))
