;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "up-split.scm")
(load "right-split.scm")
(load "painters.scm")
(load "segments->painter.scm")
(load "unit-frame.scm")

(for-each (lambda (split) ((split (segments->painter x) 4) unit-frame))
          (list up-split right-split))
