;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (make-assign inst machine labels operations pc)
  (let ((name (assign-reg-name inst)))
    (let ((target
           (get-register machine name))
          (value-exp (assign-value-exp inst)))
      (let ((value-proc
             (if (operation-exp? value-exp)
                 (make-operation-exp
                  value-exp machine labels operations)
                 (make-primitive-exp
                  (car value-exp) machine labels))))
        (lambda ()                ; execution procedure for assign
          ((machine 'add-assignment-source!) name value-exp)
          (set-contents! target (value-proc))
          (advance-pc pc))))))
