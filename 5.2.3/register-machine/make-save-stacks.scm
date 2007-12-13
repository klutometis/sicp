;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (make-save inst machine stacks pc)
  (let ((name (stack-inst-reg-name inst)))
    (let ((reg (get-register machine name)))
      (lambda ()
        (let ((assoc (assq name stacks)))
          (if assoc
              (let ((stack (cadr assoc)))
                (push stack (get-contents reg))
                (advance-pc pc))
              (error "No stack for var -- MAKE-SAVE" name)))))))

