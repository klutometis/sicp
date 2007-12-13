;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-complex-from-real-imag.scm")
(load "type=?.scm")

(define (complex? x)
  (type=? x (make-complex-from-real-imag 1 0)))


