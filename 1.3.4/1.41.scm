;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (inc n) (+ n 1))

(define (double f)
  (write-line 'doubleth)
  (lambda (x) (f (f x))))

;; Equivalent:
(((double (double double)) inc) 5)
((double (double (double (double inc)))) 5)
