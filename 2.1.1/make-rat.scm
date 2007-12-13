;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (make-rat n d)
  (let ((g (gcd n d))
        (d (cond ((and (< d 0) (< n 0)) (- d))
                 ((< d 0) (- d))
                 (else d)))
        (n (cond ((and (< d 0) (< n 0)) (- n))
                 ((< d 0) (- n))
                 (else n))))
    (cons (/ n g) (/ d g))))
