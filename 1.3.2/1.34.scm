;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (f g)
  (g 2))

;; (f square)

;; Due to applicative order, evaluates f to 2; attempts to run it.
;; In normal order, might fall into an endless loop.
(f f)
