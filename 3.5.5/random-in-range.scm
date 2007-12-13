;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (random-in-range low high)
  (let ((range (- high low)))
    (cons-stream (+ low (random range)) (random-in-range low high))))
