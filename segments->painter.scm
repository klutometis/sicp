(load "start-segment-vect.scm")
(load "end-segment-vect.scm")
(load "frame-coord-map.scm")
(load "draw-line.scm")

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) (start-segment segment))
        ((frame-coord-map frame) (end-segment segment))))
     segment-list)))
