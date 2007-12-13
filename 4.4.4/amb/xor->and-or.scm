;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (xor->and-or exp)
  (let ((p (cadr exp))
        (q (caddr exp)))
    `(and (or ,p ,q) (not (and ,p ,q)))))
