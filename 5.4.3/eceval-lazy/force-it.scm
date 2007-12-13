;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define force-it
  '(force-it
;;     (restore continue)
;;     (restore env)
;;     (restore exp)
    (restore continue)
;;     (restore exp)
;;     (restore env)
    (test (op thunk?) (reg val))
    (branch (label force-it-thunk))
;;     (restore exp)
;;    (goto (label eval-dispatch))
    (goto (reg continue))
    ))
