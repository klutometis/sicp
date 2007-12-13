;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;; (load "eval-global.scm")
;; (load "install-packages.scm")

;; (install-packages)

;; (load "analyze-sequence-alternate.scm")
;; (trace analyze-sequence)
;; (eval-global '(define x 3))
;; (eval-global '((lambda ()
;;                   (set! x 1)
;;                   (set! x (+ x x))
;;                   (set! x (+ x x )))))
;; (eval-global 'x)

;; Alyssa's and the book's analyze-sequence do the same amount of work
;; for one procedure (the book's analyze-sequence' loop is
;; short-circuited at one procedure.)

;; For two procedures, the book's hath the advantage; two procedures
;; are evaluated as a unit with no looping.
