(load "make-segment-vect.scm")

(define outline (list
                 (make-segment 0 0 0 1)
                 (make-segment 0 1 1 1)
                 (make-segment 1 1 1 0)
                 (make-segment 1 0 0 0)
                 ))

(define x (list
           (make-segment 0 0 1 1)
           (make-segment 0 1 1 0)
           ))

(define diamond (list
           (make-segment 0.5 0 1 0.5)
           (make-segment 1 0.5 0.5 1)
           (make-segment 0.5 1 0 0.5)
           (make-segment 0 0.5 0.5 0)
           ))


(define wave (list
           (make-segment 0 0.86 0.18 0.64)
           (make-segment 0.18 0.64 0.32 0.66)
           (make-segment 0.32 0.66 0.38 0.66)
           (make-segment 0.32 0.66 0.34 0.86)
           (make-segment 0.32 0.86 0.42 1)
           (make-segment 0.62 1 0.66 0.86)
           (make-segment 0.66 0.86 0.62 0.66)
           (make-segment 0.62 0.66 0.76 0.66)
           (make-segment 0.76 0.66 1 0.36)
           (make-segment 1 0.16 0.62 0.46)
           (make-segment 0.62 0.46 0.66 0)
           (make-segment 0.54 0 0.46 0.28)
           (make-segment 0.46 0.28 0.41 0)
           (make-segment 0.32 0 0.34 0.52)
           (make-segment 0.34 0.52 0.32 0.64)
           (make-segment 0.32 0.64 0.18 0.46)
           (make-segment 0.18 0.46 0 0.66)
           ))
