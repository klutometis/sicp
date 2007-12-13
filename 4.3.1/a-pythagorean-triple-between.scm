;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define a-pythagorean-triple-between
  '(define (a-pythagorean-triple-between low high)
     (let ((i (an-integer-between low high)))
       (let ((j (an-integer-between i high)))
         (let ((k (an-integer-between j high)))
           (require (= (+ (* i i) (* j j)) (* k k)))
           (list i j k))))))
