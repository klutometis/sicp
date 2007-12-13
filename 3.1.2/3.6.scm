;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "random-init.scm")
(load "rand-update.scm")

(define rand
  (let ((x random-init))
    (define (generate)
      (set! x (rand-update x))
      x)
    (define (reset new-value)
      (set! x new-value)
      x)
    (define (dispatch m)
      (cond ((eq? m 'generate) (generate))
            ((eq? m 'reset) reset)
            (else (error "Unknown request -- RAND" m))))
    dispatch))

(rand 'generate)
((rand 'reset) 200)
(rand 'generate)
