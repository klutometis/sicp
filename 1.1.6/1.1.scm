;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test-context.scm")

(test '10 10 10 '= =)
(test '(+ 5 3 4) (+ 5 3 4) 12 '= =)
(test '(- 9 1) (- 9 1) -8 '= =)
(test '(/ 6 2) (/ 6 2) 3 '= =)
(test '(+ (* 2 4) (- 4 6)) (+ (* 2 4) (- 4 6)) 6 '= =)
(test '(define a 3) 'a (eval '(define a 3) (the-environment)) 'eq? eq?)
(test '(define b (+ a 1)) 'b (eval '(define b (+ a 1)) (the-environment)) 'eq? eq?)
(test '(+ a b (* a b)) 19 (+ a b (* a b)) '= =)
(test '(= a b) #f (= a b) 'eq? eq?)
(test '(if (and (> b a) (< b (* a b))) b a)
      4
      (if (and (> b a) (< b (* a b))) b a)
      '= =)
(test '(cond ((= a 4) 6)
             ((= b 4) (+ 6 7 a))
             (else 25))
      16
      (cond ((= a 4) 6)
            ((= b 4) (+ 6 7 a))
            (else 25))
      '= =)
(test '(+ 2 (if (> b a) b a))
      6
      (+ 2 (if (> b a) b a))
      '= =)
(test '(* (cond ((> a b) a)
                ((< a b) b)
                (else -1))
          (+ a 1))
      16
      (* (cond ((> a b) a)
                ((< a b) b)
                (else -1))
          (+ a 1))
      '= =)
