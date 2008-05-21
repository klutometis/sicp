;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension
 syntax-case
 foof-loop
 (srfi 11 27))
(require '../util/util)
(module
 section-1.2.6
 (prime?
  prime-slow?
  smallest-divisor
  timed-prime-test
  search-for-primes
  fast-prime?
  fast-prime-n?
  expmod)
 (import* util square identity timed-result)
 (include "../1.2.6/prime.scm")
 (include "../1.2.6/fast-prime.scm"))
