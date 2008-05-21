;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

(define (print-center-percent-interval i)
  (display (cons (center-interval i) (percent-interval i))))

(define (par2-interval r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

(define (par1-interval r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (make-interval a b) (cons a b))

(define (make-center-width-interval c w)
  (make-interval (- c w) (+ c w)))

(define (make-center-percent-interval c p)
  (let ((width (* c p)))
    (make-center-width-interval c width)))

(define (upper-bound interval)    
  (cdr interval))

(define (lower-bound interval)
  (car interval))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (lower-bound y))
                               (/ 1.0 (upper-bound y)))))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (interval=? x y)
  (and (= (lower-bound x) (lower-bound y))
       (= (upper-bound x) (upper-bound y))))

(define (width-interval interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2))

(define (center-interval i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (percent-interval i)
  (abs (/ (width-interval i) (center-interval i))))
