;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "accumulate.scm")

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

(map square '(1 2 3))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(append '(1 2 3) '(4 5 6))

(define (length sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))

(length '(6 8 9 0))
