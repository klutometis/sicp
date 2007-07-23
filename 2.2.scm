(load "make-segment.scm")
(load "midpoint-segment.scm")
(load "print-point.scm")
(load "make-point.scm")

(define segment (make-segment (make-point 0 0)
                                (make-point 4 4)))

                
(print-point (midpoint-segment segment))
