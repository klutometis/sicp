;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case)
(require '../1.2.6/section)
(import* section-1.2.6 search-for-primes fast-prime)

(load "search-for-primes.scm")
(load "fast-prime.scm")

(define (search-for-primes n)
  (search-for-primes-test n fast-prime-n?))

;; (search-for-primes 1000000)
;; (search-for-primes 1000000000000)
(search-for-primes 10000000)
(search-for-primes 100000000)
(search-for-primes 1000000000)
(search-for-primes 10000000000)

;; Can't get correct measurements of time; what follows is a
;; non-functional hack:
;; (define t=0 (real-time-clock))
;; (search-for-primes 1000000)
;; (define t (real-time-clock))
;; (display (- t t=0))
;; (set! t=0 (real-time-clock))
;; (search-for-primes 1000000000000)
;; (set! t (real-time-clock))
;; (display (- t t=0))
;; (search-for-primes 10000)
;; (search-for-primes 100000)
;; (search-for-primes 1000000)
;; (search-for-primes 10000000)
;; (search-for-primes 10000000)
;; (search-for-primes 100000000)
;; (search-for-primes 1000000000)
;; (search-for-primes 10000000000)
;; (search-for-primes 10000000000)
;; (search-for-primes 100000000000)
;; (search-for-primes 1000000000000)
;; (search-for-primes 10000000000000)
