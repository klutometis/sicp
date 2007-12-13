;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (set-register-contents! machine register-name value)
  (set-contents! (get-register machine register-name) value)
  'done)
