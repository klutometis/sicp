;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "get-record.scm")
(load "employee-record.scm")

(define (find-employee-record name files)
  (if (null? files)
      #f
      (let* ((file (car files))
             (record (get-record name file)))
        (if record
            record
            (find-employee-record name (cdr files))))))
