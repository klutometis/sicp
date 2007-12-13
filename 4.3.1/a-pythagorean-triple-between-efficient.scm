;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define a-pythagorean-triple-between-efficient
  '(define (a-pythagorean-triple-between low high)
     (let ((i (an-integer-between low high))
           (hsq (* high high)))
       (let ((j (an-integer-between i high)))
         (let ((ksq (+ (* i i) (* j j))))
           (require (>= hsq ksq))
           (let ((k (sqrt ksq)))
             (require (integer? k))
             (list i j k)))))))
