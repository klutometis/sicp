;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (eqv-sum-triple? sum triple)
  (eqv? sum (+ (car triple) (cadr triple) (caddr triple))))

;; (eqv-sum-triple? 6 (list 3 2 1))
