;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "fold-right.scm")
(load "fold-left.scm")

(define reversandum '(1 2 3))

(define (reverse reversandum)
  (fold-right (lambda (x y) (append y (list x))) '() reversandum))

(reverse reversandum)

(define (reverse reversandum)
  (fold-left (lambda (x y) (cons y x)) '() reversandum))

(reverse reversandum)
