;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../2.2.1/section)
(import* section-2.2.1 reverse)

(define (first-denomination denominations)
  (car denominations))

(define (except-first-denomination denominations)
  (cdr denominations))

(define (no-more? l)
  (null? l))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

;; Order of the denominations doesn't matter, since
;; we're dealing with unordered combinations here,
;; not permutations.
(let ((us-coins (list 50 25 10 5 1))
      (uk-coins (list 100 50 20 10 5 2 1 0.5)))
  (check (cc 100 us-coins) => (cc 100 (reverse us-coins))))
