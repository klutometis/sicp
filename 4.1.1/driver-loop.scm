;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "eval.scm")
(load "prompt-for-input.scm")
(load "announce-output.scm")
(load "user-print.scm")
(load "input-prompt.scm")
(load "output-prompt.scm")
(load "the-global-environment.scm")

(define (driver-loop)
  (prompt-for-input input-prompt)
  (let ((input (read)))
    (let ((output (eval input the-global-environment)))
      (announce-output output-prompt)
      (user-print output)))
  (driver-loop))
