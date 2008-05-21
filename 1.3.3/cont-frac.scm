;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (cont-frac n d k)
  (define (iter i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (iter (+ i 1))))))
  (iter 0))

(define (cont-frac-iter n d k)
  (define (iter i result)
    (cond ((zero? i)
           (iter (+ i 1) (/ (n k) (d k))))
          ((> i k) result)
          (else (iter (+ i 1) (/ (n (- k i)) (+ (d (- k i)) result))))))
  (iter 0 0.0))

(define (test-cont-frac n d precision cont-frac)
  (define (iter k last-guess)
    (let ((this-guess (cont-frac n d k)))
      (if (< (abs (- last-guess this-guess)) precision)
          k
          (iter (+ k 1) this-guess))))
  (iter 0 0.0))
