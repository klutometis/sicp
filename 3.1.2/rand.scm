;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "random-init.scm")
(load "rand-update.scm")

(define rand
  (let ((x random-init))
    (lambda ()
      (set! x (rand-update x))
      x)))

;; Cheating: read Knuth 1981, ch. 3!
;; (define rand
;;   (lambda () (random (get-universal-time))))
