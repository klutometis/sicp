;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "=number?.scm")

(define (make-exponentiation base exponent)
  (cond ((or (number? base) (zero? exponent)) 0)
        ((=number? exponent 1) base)
        (else
         (let* ((decremented-exponent (- exponent 1))
                (multiplicand (if (=number? decremented-exponent 1)
                                  base
                                  (list '** base decremented-exponent))))
           (list '* exponent multiplicand)))))

