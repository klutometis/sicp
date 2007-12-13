;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define apply-dispatch
  '(apply-dispatch
;;     (perform (op write-line) (const '%%%%%%%%%%%%%%%%%%))
;;     (perform (op write-line) (reg proc))
    (test (op primitive-procedure?) (reg proc))
    (branch (label primitive-apply))
    (test (op compound-procedure?) (reg proc))  
    (branch (label compound-apply))
    (goto (label unknown-procedure-type))))
