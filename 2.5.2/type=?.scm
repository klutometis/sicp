(load "type-tag.scm")
(load "contents.scm")

;; Consequence: (complex rectangular) and (complex polar) are equal,
;; but not (rectangular) and (polar).  Would need a generic
;; (equivalent-types) therefor.
(define (type=? x1 x2)
;;   (define (types x)
;;     (if (pair? x)
;;         (except-last-pair x)
;;         (list (type-tag x))))
;;   (let ((types1 (types x1))
;;         (types2 (types x2)))
;;     (let ((equivalence
;;            (not (and (null? (keep-matching-items
;;                              types1 (lambda (tag) (memv tag types2))))
;;                      (null? (keep-matching-items
;;                              types2 (lambda (tag) (memv tag types1))))))))
;; ;;       (load-option 'format)
;; ;;       (format #t "~A ~A ~A~%" types1 types2 equivalence)
;;       equivalence)))
  (eqv? (type-tag x1) (type-tag x2)))
