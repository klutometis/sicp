;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load-option 'format)

(load "make-serializer.scm")

(define format-serialized
  (let ((serialized (make-serializer)))
      (serialized format)))
