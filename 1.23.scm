(load "search-for-primes.scm")

;; Implementation weeding out 2s.
(define (next-divisor divisor)
  (if (= divisor 2)
      3
      (+ divisor 2)))

(search-for-primes 10000000)
(search-for-primes 100000000)
(search-for-primes 1000000000)
(search-for-primes 10000000000)

;; Results: "fairly" close to two.

;; ;Loading "search-for-primes.scm"... 
;; ;  Loading "smallest-divisor.scm"... done
;; ;... done
;; ;Value: search-for-primes

;; 10000019 18
;; 10000079 19
;; 10000103 19
;; ;Value: #t

;; 100000007 73
;; 100000037 73
;; 100000039 73
;; ;Value: #t

;; 1000000007 233
;; 1000000009 242
;; 1000000021 232
;; ;Value: #t

;; 10000000019 793
;; 10000000033 788
;; 10000000061 809
;; ;Value: #t

;; ;Loading "search-for-primes.scm"... 
;; ;  Loading "smallest-divisor.scm"... done
;; ;... done
;; ;Value: search-for-primes

;; ;Value: next-divisor

;; 10000019 11
;; 10000079 9
;; 10000103 8
;; ;Value: #t

;; 100000007 36
;; 100000037 51
;; 100000039 36
;; ;Value: #t

;; 1000000007 135
;; 1000000009 121
;; 1000000021 138
;; ;Value: #t

;; 10000000019 436
;; 10000000033 428
;; 10000000061 467
;; ;Value: #t
