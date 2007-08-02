(load "make-frame.scm")
(load "make-vect.scm")
(load "segments->painter")
(load "painters.scm")

;; Unit frame at origin
(define frame (make-frame (make-vect 0 0) (make-vect 0 1) (make-vect 1 0)))

(for-each (lambda (painter) ((segments->painter painter) frame))
          (list outline x diamond wave))
