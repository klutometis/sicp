(load "type=?.scm")
(load "type>?.scm")
(load "raise.scm")
(load "contents.scm")
(load "drop.scm")
(load "reducible?.scm")

(define (apply-generic op . args)
  (define (max-type args)
    (if (null? args)
        '()
        (let ((sorted-args (sort args type>?)))
          (car sorted-args))))
  (define (raise-args args target)
    (map (lambda (arg)
           (let raise-arg ((levandum arg))
             (if (type=? levandum target)
                 levandum
                 (if (raise? levandum)
                     (raise-arg (raise levandum))
                     false)))) args))
  (define (fail)
    (error "Cannot coerce thither -- APPLY-GENERIC"
           (list op (map type-tag args))))
  (let ((max-arg (max-type args)))
    (let test-proc ((raised-args (raise-args args max-arg)))
;;      (load-option 'format)
;;       (format #t "test-proc ~A ~A ~A ~A~%" op args raised-args max-arg)
;;       (trace raise-args)
      (if (memv false raised-args)
          (fail)
          (let* ((raised-types (map type-tag raised-args))
                 (proc (get op raised-types)))
;;            (format #t "let* ~A ~A ~A~%" op raised-types proc)
            (if proc
                (let ((application (apply proc (map contents raised-args))))
                  (if (reducible? op)
                      (drop application)
                      application))
                ;; For the case when max-arg and args are self-same
                (let ((max-raised-arg (max-type raised-args)))
;;                   (format #t "~A ~A~%" raised-args (raise max-raised-arg))
                  (if (raise? max-raised-arg)
                      (test-proc (raise-args raised-args (raise max-raised-arg)))
                      (fail)))))))))
