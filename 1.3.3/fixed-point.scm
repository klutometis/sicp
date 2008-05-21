;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (fixed-point f first-guess)
  (let ((tolerance 0.00001))
    (define (close-enough? v1 v2)
      (< (abs (- v1 v2)) tolerance))
    (define (try guess)
      (format #t "try: ~A~%" guess)
      (let ((next (f guess)))
        (if (close-enough? guess next)
            next
            (try next))))
    (try first-guess)))
