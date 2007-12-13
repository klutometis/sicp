;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "permutations.scm")

(define baker first)
(define cooper second)
(define fletcher third)
(define miller fourth)
(define smith fifth)

(define (multiple-dwelling)
  (let assay ((floors (permutations '(1 2 3 4 5))))
    (let ((floor (stream-car floors)))
      (let ((baker (baker floor))
            (cooper (cooper floor))
            (fletcher (fletcher floor))
            (miller (miller floor))
            (smith (smith floor)))
      (if (and
           (not (= baker 5))
           (not (= cooper 1))
           (not (= fletcher 5))
           (not (= fletcher 1))
           (> miller cooper)
           (not (= (abs (- smith fletcher)) 1))
           (not (= (abs (- fletcher cooper)) 1)))
          (list (list 'baker baker)
                (list 'cooper cooper)
                (list 'fletcher fletcher)
                (list 'miller miller)
                (list 'smith smith))
          (assay (stream-cdr floors)))))))

(define solution (multiple-dwelling))

(test
 "non-ambiguous solution to multiple-dwelling"
 '((baker 3) (cooper 2) (fletcher 4) (miller 5) (smith 1))
 solution
 'equal? equal?
 "SICP 4.3.2")
