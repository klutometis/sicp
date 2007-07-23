(define exquadranda '(1 2 3 4))

(define (square-list exquadranda)
  (if (null? exquadranda)
      '()
      (cons (square (car exquadranda))
            (square-list (cdr exquadranda)))))

(square-list exquadranda)

(define (square-list exquadranda)
  (map square exquadranda))

(square-list exquadranda)
