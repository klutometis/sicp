;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../util/util)
(import* util square)

(define (square-tree-rec tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree-rec (car tree))
                    (square-tree-rec (cdr tree))))))

(define (square-tree-map tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree-map sub-tree)
             (square sub-tree)))
       tree))

(let ((tree '(1 (2 (3 4) 5 (6 7)))))
  (let ((rec-tree (square-tree-rec tree))
        (mapped-tree (square-tree-map tree)))
    (check rec-tree => '(1 (4 (9 16) 25 (36 49))))
    (check mapped-tree => rec-tree)))
