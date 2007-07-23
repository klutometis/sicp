(load "make-cycle.scm")

(define z (make-cycle (list 'a 'b 'c)))
;; (last-pair z) loops endlessly; see 3.13.png.

