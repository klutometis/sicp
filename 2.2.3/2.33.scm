;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../2.2.3/section)
(require '../util/util)
(import* util square)
(import* section-2.2.3
         accumulate)

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))

(check (map square '(1 2 3)) => '(1 4 9))
(check (append '(1 2 3) '(4 5 6)) => '(1 2 3 4 5 6))
(check (length '(6 8 9 0)) => 4)
