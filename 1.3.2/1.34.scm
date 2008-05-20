;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../util/util)
(import* util square)

(define (f g)
  (g 2))

(check (f square) => 4)

(check (f (lambda (z) (* z (+ z 1)))) => 6)

;; Due to applicative order, evaluates f to 2; attempts to run it.
;; In normal order, might fall into an endless loop.
(f f)
