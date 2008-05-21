;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../util/util)
(import* util square)

(define (square-list-rec exquadranda)
  (if (null? exquadranda)
      '()
      (cons (square (car exquadranda))
            (square-list-rec (cdr exquadranda)))))

(define (square-list-map exquadranda)
  (map square exquadranda))

(let ((exquadranda '(1 2 3 4))
      (exquadrata '(1 4 9 16)))
 (check (square-list-map exquadranda)
        => exquadrata)
 (check (square-list-rec exquadranda)
        => exquadrata))
