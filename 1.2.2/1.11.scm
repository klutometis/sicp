;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;;; Using an idiosyncratic chicken package here; not compatible with
;;; MIT-scheme.
(require-extension check)

(define (f-rec n)
  (cond ((< n 3) n)
        (else (+ (f-rec (- n 1)) (* 2 (f-rec (- n 2)))
                 (* 3 (f-rec (- n 3)))))))

;;; Thanks, duncanm, for the suggestion to use case.
(define (f-iter n)
  (define (iter x y z count)
    (case count
      ((0) x)
      ((1) y)
      ((2) z)
      (else (iter y z (+ (* 3 x) (* 2 y) z) (- count 1)))))
  (iter 0 1 2 n))

(define n 5)
(define n-rec (f-rec 5))
(define n-iter (f-iter 5))
(check n-rec => n-iter)
