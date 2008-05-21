(define (print-rat x)
  (format #t "~A / ~A~%"
          (numer x) (denom x)))

(define (denom x) (cdr x))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (make-rat n d)
  (let ((g (gcd n d))
        (d (cond ((and (< d 0) (< n 0)) (- d))
                 ((< d 0) (- d))
                 (else d)))
        (n (cond ((and (< d 0) (< n 0)) (- n))
                 ((< d 0) (- n))
                 (else n))))
    (cons (/ n g) (/ d g))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (numer x) (car x))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
