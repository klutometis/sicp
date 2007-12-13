;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define delay-it
  '(delay-it
    (assign val (op list) (const 'thunk) (reg exp) (reg env))
;;     (perform (op write-line) (const '$$$$$$$$$$$$))
;;     (perform (op write-line) (reg val))
;    (save continue)
;    (assign continue (label force-it))
    (goto (label eval-dispatch))
;;    (goto (reg continue))
    ))
