;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (sign-change-detector x y)
  (define (signum x)
    (if (negative? x)
        -1
        1))
  (cond ((> (signum x) (signum y)) -1)
        ((< (signum x) (signum y)) 1)
        (else 0)))

