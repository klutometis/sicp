(load "accumulate.scm")

;; Cheateth; by introducing a special case out of the
;; first term.
(define (horner-eval x coefficient-sequence)
  (+ (car coefficient-sequence)
     (accumulate ;;accumulator
      (lambda (this-coeff higher-terms) (* (+ higher-terms this-coeff) x))
      0
      (cdr coefficient-sequence))))

(horner-eval 2 (list 1 3 0 5 0 1))
