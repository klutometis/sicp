(load "make-record.scm")
(load "make-tree.scm")
(load "lookup-record.scm")

(define record-tree (make-tree (make-record 5 true) (make-tree (make-record 3 true) (make-tree (make-record 1 true) '() '()) '()) (make-tree (make-record 9 true) (make-tree (make-record 7 true) '() '()) (make-tree (make-record 11 true) '() '()))))

(for-each (lambda (key) (display (lookup key record-tree)))
          '(1 3 5 7 9 11))
