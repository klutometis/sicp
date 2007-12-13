;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "count-pairs.scm")
(load "pairs.scm")

(load-option 'format)
(for-each (lambda (pair) (format #t "~A: ~A~%" (name pair) (count-pairs (content pair)))) pairs)
