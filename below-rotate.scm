(load "beside.scm")
(load "rotate90.scm")
(load "flip-horiz.scm")
(load "compose.scm")

(define (below-rotate painter1 painter2)
  ((compose rotate90 flip-horiz) (beside painter1 painter2)))
 
