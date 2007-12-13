;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define actual-value
  '(actual-value
;;     (save exp)
;;     (save env)
;;     (save continue)
;;     (save exp)
;;     (save env)
;;     (save exp)
    (save continue)
    (assign continue (label force-it))
    (goto (label eval-dispatch))
;;    (goto (label force-it))
    ))
