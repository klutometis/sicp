;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (make-restore inst machine stack pc)
  (let ((reg (get-register machine
                           (stack-inst-reg-name inst))))
    (lambda ()
      (let ((value (pop stack))
            (from-name (stack-inst-reg-name inst)))
        (let ((to-name (car value))
              (contents (cdr value)))
          (cond ((eq? from-name to-name)
                 (set-contents! reg value)
                 (advance-pc pc))
                (else
                 (error "Popped an aleatoric var off the stack -- RESTORE"
                        (list to-name from-name)))))))))
