;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (make-restore inst machine stack pc)
  (let ((name (stack-inst-reg-name inst)))
    (let ((reg (get-register machine name)))
      (lambda ()
        ((machine 'add-saved/restored-reg!) name)
        (set-contents! reg (pop stack))    
        (advance-pc pc)))))
