;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "key-record.scm")
(load "entry-tree.scm")
(load "left-branch-tree.scm")
(load "right-branch-tree.scm")

(define (lookup given-key set-of-records)
  (let* ((this-record (entry set-of-records))
        (this-key (key this-record))
        (smaller-records (left-branch set-of-records))
        (larger-records (right-branch set-of-records)))
    (cond ((null? set-of-records) false)
          ((equal? given-key this-key) this-record)
          ((< given-key this-key) (lookup given-key smaller-records))
          ((> given-key this-key) (lookup given-key larger-records)))))
