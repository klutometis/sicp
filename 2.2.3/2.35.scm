;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "accumulate.scm")

(define tree '(1 2 (3 4) ((5 6) 7)))

(define (enumerate-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

;; Dresses up (length (enumerate-tree t)) in unnecessary garbage.
(define (count-leaves t)
  (accumulate (lambda (x y) (+ y 1)) 0 (map (lambda (x) x) (enumerate-tree t))))

(count-leaves tree)

;; Japanese solution
(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) (if (pair? x) (count-leaves x) 1)) t)))

(count-leaves tree)
