(load "get.scm")
(load "employee-record.scm")

(define (get-salary record)
  (display (division record))
  ((get 'salary (division record)) (employee-record record)))
