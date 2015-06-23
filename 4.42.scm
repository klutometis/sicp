#!/usr/bin/env chicken-scheme

(use bindings sicp-eval sicp-eval-amb test)

(define-macro (xor p q)
  `(and (or ,p ,q) (not (and ,p ,q))))

(with-require `((= ,=) (xor ,(lambda (p q) (xor p q))) (list ,list))
  (lambda (env)
    (ambeval*
     `(define (liars)
        (let ((betty (amb 1 2 3 4 5))
              (ethel (amb 1 2 3 4 5))
              (joan (amb 1 2 3 4 5))
              (kitty (amb 1 2 3 4 5))
              (mary (amb 1 2 3 4 5)))
          (require (distinct? (list betty ethel joan kitty mary)))
          (require (xor (= kitty 2) (= betty 3)))
          (require (xor (= ethel 1) (= joan 2)))
          (require (xor (= joan 3) (= ethel 5)))
          (require (xor (= kitty 2) (= mary 4)))
          (require (xor (= mary 4) (= betty 1)))
          (list (list 'betty betty)
                (list 'ethel ethel)
                (list 'joan joan)
                (list 'kitty kitty)
                (list 'mary mary))))
     env)
    (test "Non-deterministic liars"
          '((betty 3) (ethel 5) (joan 2) (kitty 1) (mary 4))
          (ambeval-n '(liars) env 1))))
