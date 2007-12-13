;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (let-test)
  (make-test
   '(let ((x 1) (y 2)) (+ x y))
   (lambda (value)
     (test
      "let clause"
      3
      value
      '= =))))
