;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension
 syntax-case
 check)
(require '../2.1.2/section)
(import* section-2.1.2
         make-segment
         make-point
         print-point
         midpoint-segment
         x-point
         y-point)

(define segment (make-segment (make-point 0 0)
                                (make-point 4 4)))
                
(let ((segment (midpoint-segment segment)))
  (check (cons (x-point segment) (y-point segment))
         => '(2 . 2)))
