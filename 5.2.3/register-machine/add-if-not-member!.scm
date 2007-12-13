;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;; Has to access the objects themselves?
(define-syntax add-if-not-member!
  (syntax-rules ()
    ((_ object objects)
     (if (member object objects)
         false
         (let ((object (list object)))
           (if (null? objects)
               (set! objects object)
               (append! objects object)))))))
