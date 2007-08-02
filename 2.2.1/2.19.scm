(load "reverse.scm")

(define us-coins (list 50 25 10 5 1))
(define us-coins-reverse (reverse (list 50 25 10 5 1)))
;; 0.5 fucks it up? or just long time.
(define uk-coins (list 100 50 20 10 5 2 1 ;; 0.5
                       ))

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

(cc 100 us-coins)
(cc 100 us-coins-reverse)
;; Order of the denominations doesn't matter, since
;; we're dealing with unordered combinations here,
;; not permutations.
