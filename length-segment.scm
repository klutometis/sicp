;; (load "make-segment.scm")
;; (load "make-point.scm")
(load "distance-points.scm")
(load "start-segment.scm")
(load "end-segment.scm")

(define (length-segment segment)
  (distance-points (start-segment segment)
                   (end-segment segment)))

;; (length-segment (make-segment (make-point 0 0) (make-point 3 4)))
