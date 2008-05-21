;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../util/util)
(require '../1.2.6/section)
(import* util approx-n?)
(import* section-1.2.6 prime? search-for-primes)

(check (/ (search-for-primes 10000000000 prime?)
          (search-for-primes 1000000000 prime?))
       (=> (lambda (x y) (approx-n? x y 0)))
       (sqrt 10))
