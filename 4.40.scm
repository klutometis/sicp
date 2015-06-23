#!/usr/bin/env chicken-scheme

(use debug sicp sicp-eval sicp-eval-amb srfi-1 test)

(with-require `((list ,list)
                (= ,=)
                (> ,>)
                (abs ,abs)
                (- ,-))
  (lambda (env)
    (ambeval*
     '(define (multiple-dwelling-indistinct)
        (let ((baker (amb 1 2 3 4 5))
              (cooper (amb 1 2 3 4 5))
              (fletcher (amb 1 2 3 4 5))
              (miller (amb 1 2 3 4 5))
              (smith (amb 1 2 3 4 5)))
          (require (not (= baker 5)))
          (require (not (= cooper 1)))
          (require (not (= fletcher 5)))
          (require (not (= fletcher 1)))
          (require (> miller cooper))
          (require (not (= (abs (- smith fletcher)) 1)))
          (require (not (= (abs (- fletcher cooper)) 1)))
          (list (list 'baker baker)
                (list 'cooper cooper)
                (list 'fletcher fletcher)
                (list 'miller miller)
                (list 'smith smith))))
     env)

    (ambeval*
     '(define (multiple-dwelling-distinct)
        (let ((baker (amb 1 2 3 4 5))
              (cooper (amb 1 2 3 4 5))
              (fletcher (amb 1 2 3 4 5))
              (miller (amb 1 2 3 4 5))
              (smith (amb 1 2 3 4 5)))
          (require
           (distinct? (list baker cooper fletcher miller smith)))
          (require (not (= baker 5)))
          (require (not (= cooper 1)))
          (require (not (= fletcher 5)))
          (require (not (= fletcher 1)))
          (require (> miller cooper))
          (require (not (= (abs (- smith fletcher)) 1)))
          (require (not (= (abs (- fletcher cooper)) 1)))
          (list (list 'baker baker)
                (list 'cooper cooper)
                (list 'fletcher fletcher)
                (list 'miller miller)
                (list 'smith smith))))
     env)
    
    (test "There are 120 assignments to floors before the requiremnt that floors be distinct."
          120
          (length (ambeval* '(multiple-dwelling-indistinct) env)))

    (test "There is 1 assignment to floors after the requirement that floors be distinct."
          1
          (length (ambeval* '(multiple-dwelling-distinct) env)))))

(with-require `((list ,list)
                (= ,=)
                (> ,>)
                (abs ,abs)
                (- ,-))
  (lambda (env)
    (ambeval*
     '(define (multiple-dwelling-pruning)
        (let ((baker (amb 1 2 3 4 5)))
          (require (not (= baker 5)))
          (let ((cooper (amb 1 2 3 4 5)))
            (require (not (= cooper 1)))
            (let ((fletcher (amb 1 2 3 4 5)))
              (require (not (= fletcher 5)))
              (require (not (= fletcher 1)))
              (require (not (= (abs (- fletcher cooper)) 1)))
              (let ((miller (amb 1 2 3 4 5)))
                (require (> miller cooper))
                (let ((smith (amb 1 2 3 4 5)))
                  (require (not (= (abs (- smith fletcher)) 1)))
                  (require
                   (distinct? (list baker cooper fletcher miller smith)))
                  (list (list 'baker baker)
                        (list 'cooper cooper)
                        (list 'fletcher fletcher)
                        (list 'miller miller)
                        (list 'smith smith))))))))
     env)
    
    (test "Pruning multiple dwelling"'
          (((baker 3) (cooper 2) (fletcher 4) (miller 5) (smith 1)))
          (ambeval* '(multiple-dwelling-pruning) env))))
