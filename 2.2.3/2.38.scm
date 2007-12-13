;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "fold-right.scm")
(load "fold-left.scm")

(define lst '(1 2 3))
(fold-right / 1 lst)
;Value: 3/2

(fold-left / 1 lst)
;Value: 1/6

(fold-right list '() lst)
;Value 2: (1 (2 (3 ())))

(fold-left list '() lst)
;Value 3: (((() 1) 2) 3)

;; Op should be commutative, such that
;; (equal? (fold-left op init seq) (fold-right op init seq))
(equal? (fold-right + 0 lst) (fold-left + 0 lst))
