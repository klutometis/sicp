(define (width-rectangle-edges rectangle)
  (length-segment (car rectangle)))

(define (width-rectangle-diagonal rectangle)
  (let* ((d1 (d1-rectangle-diagonal rectangle))
         (d2 (d2-rectangle-diagonal rectangle))
         (d1-x (x-point d1))
         (d1-y (y-point d1))
         (d2-x (x-point d2))
         (d2-y (y-point d2)))
    (distance-points d1 (make-point d1-x d2-y))))

(define (print-rectangle-edges rectangle)
  (print-segment (e1-rectangle-edges rectangle))
  (print-segment (e2-rectangle-edges rectangle)))

(define (print-rectangle-diagonal rectangle)
  (print-point (d1-rectangle-diagonal rectangle))
  (print-point (d2-rectangle-diagonal rectangle)))

(define (perimeter-rectangle width length)
  (* 2 (+ width length)))

(define (area-rectangle width length)
  (* width length))

;; A rectangle represented by two lines: its edges.
(define (make-rectangle-edges edge1 edge2)
  (cons edge1 edge2))

;; Two points representing the diagonal of a rectangle.
(define (make-rectangle-diagonal d1 d2)
  (cons d1 d2))

(define (length-segment segment)
  (distance-points (start-segment segment)
                   (end-segment segment)))

(define (length-rectangle-edges rectangle)
  (length-segment (cdr rectangle)))

(define (length-rectangle-diagonal rectangle)
  (let* ((d1 (d1-rectangle-diagonal rectangle))
         (d2 (d2-rectangle-diagonal rectangle))
         (d1-x (x-point d1))
         (d1-y (y-point d1))
         (d2-x (x-point d2))
         (d2-y (y-point d2)))
    (distance-points d2 (make-point d1-x d2-y))))

(define (e2-rectangle-edges rectangle)
  (cdr rectangle))

(define (e1-rectangle-edges rectangle)
  (car rectangle))

(define (d2-rectangle-diagonal rectangle)
  (cdr rectangle))

(define (d1-rectangle-diagonal rectangle)
  (car rectangle))

