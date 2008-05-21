;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../1.3.4/section)
(import* section-1.3.4 compose)

(define (inc n) (+ n 1))
(define (square n) (* n n))
(check ((compose square inc) 6) => 49)
