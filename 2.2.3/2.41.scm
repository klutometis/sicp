;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../2.2.3/section)
(import* section-2.2.3
         filter
         unique-triples)

(define (eqv-sum-triple? sum triple)
  (eqv? sum (+ (car triple) (cadr triple) (caddr triple))))

(define (sum-triples n sum)
  (filter (lambda (triplet) (eqv-sum-triple? sum triplet))
          (unique-triples n)))

(check (sum-triples 5 8) => '((4 3 1) (5 2 1)))
