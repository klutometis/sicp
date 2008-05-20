;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../test/test)
(require '../1.2.6/section)
(import* test approx-n?)
(import* section-1.2.6 prime? search-for-primes)

(check (/ (search-for-primes 1000000000000 prime?)
          (search-for-primes 100000000000 prime?))
       (=> (lambda (x y) (approx-n? x y 0)))
       (sqrt 10))
