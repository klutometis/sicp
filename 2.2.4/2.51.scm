(load "below.scm")
(load "painters.scm")
(load "unit-frame.scm")
(load "segments->painter.scm")
(load "below-rotate.scm")

((below-rotate (segments->painter x) (segments->painter x)) unit-frame)
((below (segments->painter x) (segments->painter x)) unit-frame)
