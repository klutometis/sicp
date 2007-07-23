(load "loop?.scm")
(load "pairs.scm")
(load "name.scm")
(load "content.scm")

(load-option 'format)
(for-each (lambda (pair) (format #t "~A: ~A~%" (name pair) (loop? (content pair)))) pairs)
