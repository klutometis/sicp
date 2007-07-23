(load "frame.scm")
(load "frame-cons.scm")

(define frame (make-frame 1 2 3))
(define frame-cons (make-frame-cons 1 2 3))

(origin-frame frame)
(origin-frame-cons frame-cons)

(edge1-frame frame)
(edge1-frame-cons frame-cons)

(edge2-frame frame)
(edge2-frame-cons frame-cons)
