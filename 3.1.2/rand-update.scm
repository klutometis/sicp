;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (rand-update x)
  (let ((a 40)
        (b 3641)
        (m 729))
    (modulo (+ (* a x) b) m)))

    
