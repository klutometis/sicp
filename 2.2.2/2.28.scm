;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension check)

;; Recursive Japanese solution, based on reference count-leaves
(define (fringe tree)
  (cond ((null? tree) tree)
        ;; Prime the leaf for appension by belisting it
        ((not (pair? tree)) (list tree))
        ;; Otherwise, recurse each branch separately (cdr may be
        ;; null, of course).
        (else (append (fringe (car tree))
                      (fringe (cdr tree))))))
        
(let ((tree '(1 2 (3 4 (5 (6))))))
  (check (fringe tree) => '(1 2 3 4 5 6)))
