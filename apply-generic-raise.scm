#!/usr/bin/env chicken-scheme
(define supertype-table (make-parameter (make-hash-table)))

(define (put-supertype subtype supertype)
  (hash-table-set! (supertype-table) subtype supertype))

(define (get-supertype subtype)
  (hash-table-ref/default (supertype-table) subtype #f))

(put-supertype 'integer 'rational)
(put-supertype 'rational 'real)
(put-supertype 'real 'complex)

(define (supertype? subtype type)
  (let iter ((supertype (get-supertype subtype)))
    (and supertype
         (or (eq? supertype type)
             (iter (get-supertype supertype))))))

(define (raise-until-equitable arg type)
  (if (eq? (type-tag arg) type)
      arg
      (raise-until-equitable (raise arg) type)))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (cond ((= (length args) 1)
                 (let ((superarg (raise (car args))))
                   (if superarg
                       (apply-generic op superarg)
                       (error "No method for these types"
                              (list op type-tags)))))
                ((= (length args) 2)
                 (let ((type1 (car type-tags))
                       (type2 (cadr type-tags))
                       (a1 (car args))
                       (a2 (cadr args)))
                   (cond ((supertype? type1 type2)
                          (apply-generic op
                                         (raise-until-equitable a1 type2)
                                         a2))
                         ((supertype? type2 type1)
                          (apply-generic op a1 (raise-until-equitable a2
                                                                      type1)))
                         (else (error "No method for these types"
                                      (list op type-tags))))))
                (else (error "No method for these types" (list op type-tags))))))))
