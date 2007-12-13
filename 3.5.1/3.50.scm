;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "stream-map-general.scm")
(load "stream-enumerate-interval.scm")
(load "display-stream.scm")

(define interval0 (stream-enumerate-interval 1 3))
(define interval1 (stream-enumerate-interval 4 6))
(define interval2 (stream-enumerate-interval 5 7))

(display-stream
 (stream-map (lambda (x y z) (+ x y z))
             interval0 interval1 interval2))
