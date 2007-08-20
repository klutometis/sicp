(load "register-machine-context.scm")
(load "register-machine/factorial-machine-recursive.scm")
(load "test-context.scm")

(load-option 'regular-expression)

(define (run-fact n)
  (define output
    (with-output-to-string
      (lambda ()
        (set-register-contents! factorial-machine-recursive 'n n)
        (start factorial-machine-recursive)
        (get-register-contents factorial-machine-recursive 'val))))

  (define matches
    (re-string-match
     "\n(total-pushes = \\([0-9]*\\) maximum-depth = \\([0-9]*\\))"
     output))

  (list
   n
   (string->number (re-match-extract output matches 1))
   (string->number (re-match-extract output matches 2))))

(define push-stack-n (map run-fact (iota 5 2)))

(test
 "total pushes and max depth for recursive factorial n"
 '((2 2 2) (3 6 4) (4 12 6) (5 20 8) (6 30 10))
 push-stack-n
 'equal? equal?)

;; For pushes: (* n (- n 1)); depth: (* 2 (- n 1)).
