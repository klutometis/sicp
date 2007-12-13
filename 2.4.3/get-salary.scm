;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "get.scm")
(load "employee-record.scm")

(define (get-salary record)
  (display (division record))
  ((get 'salary (division record)) (employee-record record)))
