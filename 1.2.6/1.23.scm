;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../1.2.6/section)
(require '../util/util)
(import* util range?)
(import* section-1.2.6 prime? prime-slow? search-for-primes)

;;; Ratio is consistently about 0.2 less than 2.0 on this machine.
(check
 (/ (search-for-primes 1000000000 prime-slow?)
    (search-for-primes 1000000000 prime?))
 (=> (lambda (x y) (range? x -0.2 0.0 y))) 2)
