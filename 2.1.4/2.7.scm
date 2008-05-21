;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../2.1.4/section)
(import* section-2.1.4
         make-interval
         lower-bound
         upper-bound)

(let ((i (make-interval 0.707 1.0)))
  (check (cons (lower-bound i)
               (upper-bound i)) => '(0.707 . 1.0)))
