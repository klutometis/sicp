;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (divides? a b)
  (= (remainder b a) 0))

;; Implementation weeding out 2s.
(define (next-divisor/2 divisor)
  (if (= divisor 2) 3 (+ divisor 2)))

;; "Naive" implementation (sans weeding out 2s).
(define (next-divisor divisor)
  (+ divisor 1))

(define (find-divisor n test-divisor next-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n
                            (next-divisor test-divisor)
                            next-divisor))))

(define (smallest-divisor n)
  (find-divisor n 2 next-divisor))

(define (smallest-divisor/2 n)
  (find-divisor n 2 next-divisor/2))

(define (prime-slow? n)
  (= n (smallest-divisor n)))

(define (prime? n)
  (= n (smallest-divisor/2 n)))

(define (timed-prime-test n prime-test)
  (let-values (((time result)
                (timed-result (lambda () (prime-test n)))))
    time))

(define (search-for-primes n prime-test)
  (loop continue ((with n n)
                  (with primes 0 (+ primes 1))
                  (until (= primes 3))
                  (with local-time 0)
                  (for total-time (summing local-time)))
        => total-time
        (if (even? n)
            (continue (=> n (+ n 1)))
            (let-values (((time result)
                          (timed-result
                           (lambda () (prime-test n)))))
              (continue (=> n (+ n 2))
                        (=> primes (if result (+ primes 1) primes))
                        (=> local-time time))))))
