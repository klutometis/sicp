;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

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
