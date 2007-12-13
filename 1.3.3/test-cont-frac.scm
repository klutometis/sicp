;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (test-cont-frac n d precision)
  (define (iter k last-guess)
    (let ((this-guess (cont-frac n d k)))
      (if (< (abs (- last-guess this-guess)) precision)
          (begin
            (display this-guess)
            k)
          (iter (+ k 1) this-guess))))
  (iter 0 0.0))
