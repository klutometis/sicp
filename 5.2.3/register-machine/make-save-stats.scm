;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (make-save inst machine stack pc)
  (let ((name (stack-inst-reg-name inst)))
    (let ((reg (get-register machine name)))
      (lambda ()
        ((machine 'add-saved/restored-reg!) name)
        (push stack (get-contents reg))
        (advance-pc pc)))))
