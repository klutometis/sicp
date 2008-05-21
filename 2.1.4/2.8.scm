;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../2.1.4/section)
(import* section-2.1.4
         make-interval
         sub-interval
         interval=?)

(define minuend (make-interval -1.0 0.5))
(define subtrahend (make-interval -3.0 -2.0))
(let ((difference (sub-interval minuend subtrahend)))
  (check difference (=> interval=?) (make-interval 2.0 2.5)))
