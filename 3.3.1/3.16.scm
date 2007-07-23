(load "count-pairs.scm")
(load "pairs.scm")

(load-option 'format)
(for-each (lambda (pair) (format #t "~A: ~A~%" (name pair) (count-pairs (content pair)))) pairs)
