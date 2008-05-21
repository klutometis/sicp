;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension
 syntax-case
 check)
(require '../2.1.4/section)
(require '../util/util)
(import* section-2.1.4
         upper-bound
         lower-bound
         mul-interval
         make-interval)
(import* util
         except?)

(define (div-interval x y)
  (let ((upper-bound-y (upper-bound y))
        (lower-bound-y (lower-bound y)))
    (if (or (zero? upper-bound-y) (zero? lower-bound-y))
        (error 'div-internal "Thou dividest by zeno [sic], Freund." (exn bounds))
        (let ((divisor (make-interval (/ 1.0 (upper-bound-y))
                                      (/ 1.0 (lower-bound-y)))))
          (mul-interval x divisor)))))

(let ((i (make-interval -2 5))
      (j (make-interval -1 0)))
  ;; Trigger division-by-zero
  (check (except? (lambda () (div-interval i j))) => #t))
