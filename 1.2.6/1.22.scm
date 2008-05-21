;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../util/util)
(require '../1.2.6/section)
(import* util range?)
(import* section-1.2.6 prime? prime-slow? search-for-primes)

(check (/ (search-for-primes 1000000000 prime-slow?)
          (search-for-primes 100000000 prime-slow?))
       (=> (lambda (x y) (range? x -1 1 y)))
       (sqrt 10))
