;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;; Works by incrementally building the tree from
;; constituent simples; repetition is avoided
;; by the omnipresence of each new element after the
;; mapping recursion.
(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(define set '(1 2 3 4))
(subsets set)
