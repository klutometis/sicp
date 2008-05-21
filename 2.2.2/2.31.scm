;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../util/util)
(import* util square)

(define (tree-map transformation tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map transformation sub-tree)
             (transformation sub-tree)))
       tree))

(define (square-tree exquadrandum) (tree-map square exquadrandum))

(let ((exquadrandum '(1 (2 (3 4) 5 (6 7)))))
  (check (square-tree exquadrandum)
         => '(1 (4 (9 16) 25 (36 49)))))
