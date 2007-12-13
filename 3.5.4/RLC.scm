;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "integral.scm")
(load "add-streams.scm")
(load "scale-stream.scm")

(define (RLC R L C dt)
  (lambda (vc0 il0)
    (define il (integral (delay dil) il0 dt))
    (define vc (integral (delay dvc) vc0 dt))
    (define dil (add-streams (scale-stream vc (/ 1 C))
                            (scale-stream il (- (/ R l)))))
    (define dvc (scale-stream il (- (/ 1 C))))
    (cons il vc)))
