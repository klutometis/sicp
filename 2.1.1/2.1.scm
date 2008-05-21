;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../2.1.1/section)
(import* section-2.1.1 make-rat print-rat numer denom)

(let ((r1 (make-rat -1 -2))
      (r2 (make-rat -1 2))
      (r3 (make-rat 1 -2)))
  (check (cons (numer r1) (denom r1)) => '(1 . 2))
  (check (cons (numer r2) (denom r2)) => '(-1 . 2))
  (check (cons (numer r3) (denom r3)) => '(-1 . 2)))
