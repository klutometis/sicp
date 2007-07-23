(load "up-split.scm")
(load "right-split.scm")
(load "painters.scm")
(load "segments->painter.scm")
(load "unit-frame.scm")

(for-each (lambda (split) ((split (segments->painter x) 4) unit-frame))
          (list up-split right-split))
