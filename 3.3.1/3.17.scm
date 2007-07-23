(load "count-pairs-aux.scm")
(load "pairs.scm")

;; We get 1 for p7: error? Consisteth of '(a), after all.
(load-option 'format)
(for-each (lambda (pair) (format #t "~A: ~A~%" (name pair) (count-pairs (content pair)))) pairs)
