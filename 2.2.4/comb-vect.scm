(load "make-vect.scm")
(load "xcor-vect.scm")
(load "ycor-vect.scm")

(define (comb-vect v1 v2 op)
  (let ((x1 (xcor-vect v1))
        (y1 (ycor-vect v1))
        (x2 (xcor-vect v2))
        (y2 (ycor-vect v2)))
    (make-vect (op x1 x2) (op y1 y2))))

    
