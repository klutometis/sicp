;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define eval
  '(eval
    (perform (op initialize-stack))
    (assign continue (label done))
    (goto (label eval-dispatch))))
