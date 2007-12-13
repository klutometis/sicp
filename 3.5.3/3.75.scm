;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "make-zero-crossings.scm")
(load "noisy-signal.scm")

(define dampened-crossings (stream->list (make-zero-crossings noisy-signal 0 0)))

(test
 "zero-crossings on average-dampened input source"
 '(0 0 0 0 0 0 -1)
 dampened-crossings
 'equal?
 equal?)
