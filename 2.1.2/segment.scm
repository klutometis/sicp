;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (y-point point)
  (cdr point))

(define (x-point point)
  (car point))

(define (print-segment segment)
  (print-point (start-segment segment))
  (print-point (end-segment segment)))

(define (print-point point)
  (format #t "(~A, ~A)~%"
          (x-point point)
          (y-point point)))

(define (midpoint-segment segment)
  (let ((incipiens (start-segment segment))
        (terminans (end-segment segment)))
    (make-point (average (x-point incipiens) (x-point terminans))
                (average (y-point incipiens) (y-point terminans)))))

(define (make-segment incipiens terminans)
  (cons incipiens terminans))

(define (make-point x y)
  (cons x y))

(define (end-segment segment)
  (cdr segment))

(define (start-segment segment)
  (car segment))

(define (distance-points p1 p2)
  (sqrt (+ (square (- (x-point p2) (x-point p1)))
           (square (- (y-point p2) (y-point p1))))))
