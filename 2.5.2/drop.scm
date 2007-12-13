;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "equ?.scm")
(load "project.scm")
(load "project?.scm")
(load "raise.scm")

(define (drop x)
  (if (project? x)
      (let ((projectum (project x)))
        (if (equ? x (raise projectum))
            (drop projectum)
            x))
      x))
