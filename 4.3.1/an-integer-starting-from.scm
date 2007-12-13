;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define an-integer-starting-from
  '(define (an-integer-starting-from n)
     (amb n (an-integer-starting-from (+ n 1)))))
