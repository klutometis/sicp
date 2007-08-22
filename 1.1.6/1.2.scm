(load "test-context.scm")

(define quotient
  (/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
     (* 3 (- 6 2) (- 2 7))))


(test '(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
          (* 3 (- 6 2) (- 2 7)))
      (/ -37 150)
      quotient
      '= =)
