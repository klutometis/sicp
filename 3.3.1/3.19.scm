;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "loop-constant?.scm")
(load "pairs.scm")
(load "name.scm")
(load "content.scm")

;; Store the incipit; comes it back?
(load-option 'format)
(for-each (lambda (pair) (format #t "~A: ~A~%" (name pair) (loop? (content pair)))) pairs)
