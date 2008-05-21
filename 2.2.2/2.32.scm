;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension check)

;; Works by incrementally building the tree from
;; constituent simples; repetition is avoided
;; by the omnipresence of each new element after the
;; mapping recursion.
(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(let ((set '(1 2 3 4)))
  (check (subsets set)
         => '(() (4) (3) (3 4) (2) (2 4) (2 3) (2 3 4) (1) (1 4)
              (1 3) (1 3 4) (1 2) (1 2 4) (1 2 3) (1 2 3 4))))
