;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "eval-global.scm")
(load "install-packages.scm")

(install-packages)

(eval-global '(define (assoc object alist)
                (if (null? alist)
                    false
                    (let* ((association (car alist))
                           (key (car association)))
                      (if (equal? object key)
                          association
                          (assoc object (cdr alist)))))))

(define extended-cond
  (eval-global '(cond ((assoc 'b '((a 1) (b 2))) => cadr)
                      (else false))))

(test "extended cond" 2 extended-cond '= =)
