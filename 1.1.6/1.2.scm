;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test-context.scm")

(define quotient
  (/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
     (* 3 (- 6 2) (- 2 7))))


(test '(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
          (* 3 (- 6 2) (- 2 7)))
      (/ -37 150)
      quotient
      '= =)
