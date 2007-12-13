;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "segment.scm")
(load "rectangle-edges.scm")
(load "rectangle-diagonal.scm")
(load "perimeter-rectangle.scm")
(load "area-rectangle.scm")

(define rectangle1 (make-rectangle-edges (make-segment (make-point 0 0) (make-point 0 5))
                                         (make-segment (make-point 0 5) (make-point 4 5))))
(define length-rectangle1 (length-rectangle-edges rectangle1))
(define width-rectangle1 (width-rectangle-edges rectangle1))
(perimeter-rectangle length-rectangle1 width-rectangle1)
(area-rectangle length-rectangle1 width-rectangle1)

(define rectangle2 (make-rectangle-diagonal (make-point 0 0) (make-point 4 5)))
(define length-rectangle2 (length-rectangle-diagonal rectangle2))
(define width-rectangle2 (width-rectangle-diagonal rectangle2))
(perimeter-rectangle length-rectangle2 width-rectangle2)
(area-rectangle length-rectangle2 width-rectangle2)

