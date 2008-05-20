;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check (srfi 1 27))
(require '../1.2.6/section)
(require '../util/util)
(import* util square identity)
(import* section-1.2.6 expmod)

(define (expmod-miller-rabin base exp m)
  ;; Return 0 if we've discovered a ``non-trivial
  ;; square-root of 1-modulo-n.''
  (cond ((= exp 0) 1)
        ((even? exp)
         ;; I assume that we check for square roots here.
         (if (and (not (or (= base 1) (= base exp)))
                  (= (expmod base 2 m) 1))
                  0
                  (remainder (square (expmod base (/ exp 2) m))
                             m)))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (define a-n-1-mod-n (expmod-miller-rabin a (- n 1) n))
    (and (not (zero? a-n-1-mod-n)) (= a-n-1-mod-n 1)))
  (try-it (+ 1 (random-integer (- n 1)))))

(define (miller-rabin-prime? n times)
  (cond ((= times 0) #t)
        ((miller-rabin-test n) (miller-rabin-prime? n (- times 1)))
        (else #f)))

(define (miller-rabin-prime-n? n)
  (miller-rabin-prime? n 10))

;; Carmichaels
(check (any identity
            (list (miller-rabin-prime-n? 561)
                  (miller-rabin-prime-n? 1105)
                  (miller-rabin-prime-n? 1729)
                  (miller-rabin-prime-n? 2465)
                  (miller-rabin-prime-n? 2821)
                  (miller-rabin-prime-n? 6601)))
       => #f)
;; Bona fide primes
(check (every identity
              (list (miller-rabin-prime-n? 2)
                    (miller-rabin-prime-n? 3)
                    (miller-rabin-prime-n? 7723)
                    (miller-rabin-prime-n? 7727)
                    (miller-rabin-prime-n? 7741)
                    (miller-rabin-prime-n? 7753)
                    (miller-rabin-prime-n? 7757)
                    (miller-rabin-prime-n? 7759)))
       => #t)
;; Non-Carmichael-non-primes
(check (miller-rabin-prime-n? 4) => #f)
