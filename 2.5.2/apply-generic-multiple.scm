;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "type-tag.scm")
(load "contents.scm")
(load "get-coercion.scm")

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args))
        (n-args (length args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (let iter-types ((coercentes type-tags))
            (if (null? coercentes)
                (error "Neither function nor coercion -- APPLY-GENERIC"
                       (list op type-tags))
                (let* ((coercens (car coercentes))
                       (coercenda (make-list n-args coercens))
                       (coerced-proc (get op coercenda)))
                  (if coerced-proc
                      (let ((coercita (map (lambda (arg)
                                             (let* ((content (contents arg))
                                                    (type (type-tag arg))
                                                    (coercitor (get-coercion type coercens)))
                                               ;; Don't coerce identical types.
                                               (cond ((eqv? type coercens) content)
                                                     (coercitor (coercitor content))
                                                     ;; A coercion exists, but failed.
                                                     (else false)))) args)))
                        ;; No/failed coercion
                        (if (memv false coercita)
                            (iter-types (cdr coercentes))
                            (apply coerced-proc coercita)))
                      (iter-types (cdr coercentes))))))))))
