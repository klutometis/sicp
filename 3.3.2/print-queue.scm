;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "front-ptr.scm")

(load-option 'format)
(define (print-queue queue)
  (for-each (lambda (element) (format #t "~A " element)) (front-ptr queue))
  (newline))
