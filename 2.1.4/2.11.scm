;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../2.1.4/section)
(import* section-2.1.4
         make-interval
         lower-bound
         upper-bound
         mul-interval)

(define i (make-interval -2 5))
(define j (make-interval -3 7))

(define (mul-interval-case x y)
  (let* ((a (lower-bound x))
         (b (upper-bound x))
         (c (lower-bound y))
         (d (upper-bound y))
         (w (delay (* a c)))
         (x (delay (* a d)))
         (y (delay (* b c)))
         (z (delay (* b d))))
    (define (make-result lower upper)
      (make-interval (force lower) (force upper)))
    (define (alpha)
      (positive? a))
    (define (beta)
      (positive? b))
    (define (gamma)
      (positive? c))
    (define (delta)
      (positive? d))
    (if (alpha)
        (if (beta)
            (if (gamma)
                (if (delta)
                    (make-result w z))
                (if (delta)
                    (make-result y z)
                    (make-result y w))))
        (if (beta)
            (if (gamma)
                (if (delta)
                    (make-result x z))
                (if (delta)
                    ;; Pathological case
                    (make-interval (min (force w) (force x) (force y) (force z))
                                   (max (force w) (force x) (force y) (force z)))
                    (make-result y x)))
            (if (gamma)
                (if (delta)
                    (make-result x y))
                (if (delta)
                    (make-result x w)
                    (make-result z w)))))))

(check (mul-interval i j) => (mul-interval-case i j))
