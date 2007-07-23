(load "make-table.scm")
(load "lookup.scm")
(load "insert!.scm")

(define table (make-table equal?))
(insert! 'a 'b 1 table)
(lookup 'a 'b table)
