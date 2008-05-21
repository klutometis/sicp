;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../2.2.3/section)
(require '../1.2.6/section)
(import* section-1.2.6
         prime?)
(import* section-2.2.3
         unique-pairs
         filter)

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))

(check (prime-sum-pairs 6)
       => '((2 1 3) (3 2 5) (4 1 5) (4 3 7)
            (5 2 7) (6 1 7) (6 5 11)))
