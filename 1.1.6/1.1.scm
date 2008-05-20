;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension check)

(check-reset!)
(check 10 => 10)
(check (+ 5 3 4) => 12)
(check (- 9 1) => 8)
(check (+ (* 2 4) (- 4 6)) => 6)

(define a 3)
(define b (+ a 1))

(check (+ a b (* a b)) => 19)
(check (= a b) => #f)
(check (if (and (> b a) (< b (* a b))) b a)
       => 4)
(check (cond ((= a 4) 6)
             ((= b 4) (+ 6 7 a))
             (else 25))
       => 16)
(check (+ 2 (if (> b a) b a))
       => 6)
(check (* (cond ((> a b) a)
                ((< a b) b)
                (else -1))
          (+ a 1))
       => 16)
(check-report)
