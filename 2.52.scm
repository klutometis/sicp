(load "corner-split.scm")
(load "painters.scm")
(load "segments->painter.scm")
(load "square-limit.scm")
(load "unit-frame.scm")

;; Add smile to wave
(define wave-smile (append wave
                           (list (make-segment 0.44 0.80 0.56 0.80))))

;; One copy of right-split and up-split images
(define (corner-split painter n)
  (if (zero? n)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left up)
              (bottom-right right)
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

;; That looketh outward from each corner
(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-vert rotate180
                                  identity flip-horiz)))
    (combine4 (corner-split painter n))))

((square-limit (segments->painter wave-smile) 4) unit-frame)
