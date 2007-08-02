(load "square-of-four.scm")
(load "corner-split.scm")
(load "flip-horiz.scm")
(load "flip-vert.scm")
(load "identity.scm")
(load "rotate180.scm")

(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-horiz identity
                                  rotate180 flip-vert)))
    (combine4 (corner-split painter n))))
