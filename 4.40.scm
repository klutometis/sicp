#!/usr/bin/env chicken-scheme

(use debug sicp sicp-eval sicp-eval-amb srfi-1 test)

(with-require `((member ,member)
                (list ,list)
                (= ,=)
                (> ,>)
                (abs ,abs)
                (- ,-))
  (lambda (env)
    (ambeval*
     '(define (distinct? items)
        (cond ((null? items) true)
              ((null? (cdr items)) true)
              ((member (car items) (cdr items)) false)
              (else (distinct? (cdr items)))))
     env)
    
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
    
    (test "There are 120 assignments to floors before the requiremnt that floors be distinct"
          (length (ambeval* '(multiple-dwelling-indistinct) env)))))
