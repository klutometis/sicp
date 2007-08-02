(load-option 'format)
(load-option 'regular-expression)

(load "test.scm")
(load "match?.scm")
(load "eval-global.scm")
(load "install-packages.scm")

(install-packages)

;; a. Newline and display are primitives, which are evaluated strictly
;; (non-lazily).

(define expressions
  (list '(define (p1 x)
           (set! x (cons x '(2)))
           x)
        '(define (p2 x)
           (define (p e)
             e
             x)
           (p (set! x (cons x '(2)))))
        '(p1 1)
        '(p2 1)))

(load "eval-sequence.scm")
(define lazy-eval (map eval-global expressions))

(load "eval-sequence-force.scm")
(define fascist-eval (map eval-global expressions))

(test
 "lazy-eval"
 "(ok ok (1 2) (thunk 1 (#.hash-table [0-9]*.)))"
 lazy-eval
 'match?
 match?)

(test
 "fascist-eval"
 '(ok ok (1 2) (1 2))
 fascist-eval
 'equal?
 equal?)

;; b. See tests supra.

;; c. A primitive forces to itself.

;; d. Lazy evaluation encourages a side-effect-free (vel functional
;; vel enlightened) style of programming.
