;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension check)
(require '../util/util)
(import* util cube square approx?)

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpsons f a b n)
  (define (coefficient i)
    (cond ((or (zero? i) (= n i)) 1)
          ((even? i) 2)
          (else 4)))
  (define interval (/ (- b a) n))
  (define (term i)
    (* (coefficient i) (f (+ a (* i interval)))))
  (* (/ interval 3) (sum term a (lambda (i) (+ i 1)) n)))

(check (simpsons (lambda (x) (/ 1 (+ 1 (square x)))) 0 1 100)
       (=> approx?) 0.78539)
(check (simpsons square 2 5 100) (=> approx?) 38.79516)
(check (simpsons square 2 5 1000) (=> approx?) 38.97995)
(check (simpsons cube 0 1 100) (=> approx?) 0.25)
