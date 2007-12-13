;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;; See 3.27.png.  Though the first call to memo-fib participates in
;; the global environment, subsequent calls are contained within
;; memoize's environment; and thus make use of the local table.

;; Memoize's local table caches previous results, cutting computation
;; from Theta(phi^n) to Theta(n); the cache effectively stops
;; redundant cascading of the computational tree.

;; (memoize fib) would invoke fib in the global environment, and
;; memoize would be forced to rebuild its cache with every invocation;
;; castrating it.
