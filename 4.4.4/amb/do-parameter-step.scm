;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (do-parameter-step parameter)
  (if (do-parameter-step-omitted? parameter)
      (do-parameter-variable parameter)
      (caddr parameter)))
