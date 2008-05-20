;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../1.2.6/section)
(require '../test/test)
(import* section-1.2.6 search-for-primes fast-prime-n?)
(import* test approx-n?)

;;; Would expect the times to be about log_10{100} ~= 3.0 apart; in
;;; practice, slightly less.  Constants?
(check
 (/ (search-for-primes (inexact->exact 1e15) fast-prime-n?)
    (search-for-primes (inexact->exact 1e12) fast-prime-n?))
 (=> (lambda (x y) (approx-n? x y 0)))
 (/ (log 1000) (log 10)))
