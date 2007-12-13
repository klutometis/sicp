;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (eceval-global exp)
  (set-register-contents! eceval 'exp exp)
  (set-register-contents! eceval 'env (get-global-environment))
  (start eceval)
  (get-register-contents eceval 'val))
