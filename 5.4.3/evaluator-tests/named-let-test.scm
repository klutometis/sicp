;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (named-let-test)
  (make-test
   '(let fib-iter ((a 1)
                   (b 0)
                   (count 6))
      (if (= count 0)
          b
          (fib-iter (+ a b) a (- count 1))))
   (lambda (value)
     (test
      "named-let sixth fibonacci"
      8
      value
      '= =
      "http://www.research.att.com/~njas/sequences/A000045"))))
