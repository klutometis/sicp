(load "painters.scm")
(load "flip-horiz.scm")
(load "rotate180.scm")
(load "rotate270.scm")
(load "make-frame.scm")
(load "make-vect.scm")
(load "segments->painter.scm")

(define frame (make-frame (make-vect 0 0) (make-vect 0 1) (make-vect 1 0)))

(for-each (lambda (transformation) ((transformation (segments->painter wave)) frame))
          (list flip-horiz rotate180 rotate270))
