;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (split op1 op2)
  (define (split-iter painter n)
    (if (zero? n)
        painter
        (let ((smaller (split-iter painter (- n 1))))
          (op1 painter (op2 smaller smaller)))))
  ;; Curried?
  (lambda (painter n) (split-iter painter n)))
