(define (tree-map transformation tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map transformation sub-tree)
             (transformation sub-tree)))
       tree))

(define exquadrandum (list 1 (list 2 (list 3 4) 5 (list 6 7))))

(define (square-tree exquadrandum) (tree-map square exquadrandum))

(square-tree tree)
