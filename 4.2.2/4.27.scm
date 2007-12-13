;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "match?.scm")
(load "eval-global.scm")
(load "install-packages.scm")

(install-packages)

(define expressions
  (list
   '(define count 0)
   '(define (id x)
      (set! count (+ count 1))
      x)
   '(define w (id (id 10)))
   'count
   'w
   'count))

(define lazy-side-effects (map eval-global expressions))

(test
 "lazy evaluation and side effects"
 "(ok ok ok 1 (thunk (id 10) (#.hash-table [0-9]*.)) 1)"
 lazy-side-effects
 'match?
 match?)
