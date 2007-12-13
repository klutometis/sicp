;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (sine angle)
  (define (cube x) (* x x x))
  (define (p x)
    (display x)
    (newline)
    (- (* 3 x) (* 4 (cube x)))
    )
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(sine 12.15)
