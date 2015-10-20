#!/usr/bin/env chicken-scheme
(use alist-lib debug sicp-eval sicp-eval-amb test)

(with-require `((list ,list) (eq? ,eq?) (cadr ,cadr) (caddr ,caddr) (debug ,(lambda x (debug x))))
  (lambda (env)
    (ambeval* '(define (map f l)
                 (if (null? l)
                     '()
                     (cons (f (car l)) (map f (cdr l))))) env)
    (ambeval* '(define (for-each f l)
                 (if (null? l)
                     'ok
                     (begin
                       (f (car l))
                       (for-each f (cdr l))))) env)
    (ambeval* '(define father-name car) env)
    (ambeval* '(define father-daughter cadr) env)
    (ambeval* '(define father-yacht caddr) env)
    (ambeval* '(define (make-daughters)
                 (amb 'mary 'gabrielle 'lorna 'rosalind 'melissa)) env)
    (ambeval* '(define make-yachts make-daughters) env)
    (ambeval* '(define (make-father name)
                 (list name (make-daughters) (make-yachts)))
              env)
    (ambeval* '(define (father-of daughter fathers)
                 (if (null? fathers)
                     ;; Daughter of no-one: when would this happen?
                     false
                     (let ((father (car fathers)))
                       (if (eq? daughter (father-daughter father))
                           father
                           (father-of daughter (cdr fathers))))))
              env)
    (ambeval*
     '(define (yachts)
        (let ((moore (make-father 'moore)))
          ;; "Mary Ann Moore . . ."
          (require (eq? (father-daughter moore) 'mary))
          ;; "Mr. Moore owns the Lorna."
          (require (eq? (father-yacht moore) 'lorna))
          (let ((downing (make-father 'downing)))
            ;; "The Melissa, owned by Colonel Downing . . ."
            (require (eq? (father-yacht downing) 'melissa))
            (let ((hall (make-father 'hall)))
              ;; "Mr. Hall the Rosalind . . ."
              (require (eq? (father-yacht hall) 'rosalind))
              (let ((hood (make-father 'hood)))
                ;; "Sir Barnacle's yatch is the Gabrielle."
                (require (eq? (father-yacht hood) 'gabrielle))
                ;; "Melissa . . . is Sir Barnacel's daughter."
                (require (eq? (father-daughter hood) 'melissa))
                (let ((parker (make-father 'parker)))
                  (let ((fathers (list moore downing hall hood parker)))
                    ;; The daughters should be distinct.
                    (require (distinct? (map father-daughter fathers)))
                    ;; The yachts should be distinct.
                    (require (distinct? (map father-yacht fathers)))
                    ;; The yacht-daughter pairs should be distinct:
                    ;; "each has named his yacht after a daughter of
                    ;; one of the others."
                    (for-each (lambda (father) (require (distinct? (list (father-daughter father)
                                                                    (father-yacht father)))))
                      fathers)
                    ;; "The Melissa, owned by Colonel Downing, is
                    ;; named after Sir Barnacle's daughter;" we have
                    ;; to handle this constraint after the
                    ;; distinctness-constraints, though, otherwise the
                    ;; father-daughter search (father-of . . .) might
                    ;; fail.
                    (require (eq? (father-daughter parker)
                                  (father-yacht (father-of 'gabrielle fathers))))
                    fathers)))))))
     env)
    (test "Downing is Lorna's father."
          '(((moore mary lorna)
             (downing lorna melissa)
             (hall gabrielle rosalind)
             (hood melissa gabrielle)
             (parker rosalind mary)))
          (ambeval* '(yachts) env))
    (ambeval*
     '(define (yachts-no-moore)
        (let ((moore (make-father 'moore)))
          (require (eq? (father-yacht moore) 'lorna))
          (let ((downing (make-father 'downing)))
            (require (eq? (father-yacht downing) 'melissa))
            (let ((hall (make-father 'hall)))
              (require (eq? (father-yacht hall) 'rosalind))
              (let ((hood (make-father 'hood)))
                (require (eq? (father-yacht hood) 'gabrielle))
                (require (eq? (father-daughter hood) 'melissa))
                (let ((parker (make-father 'parker)))
                  (let ((fathers (list moore downing hall hood parker)))
                    (require (distinct? (map father-daughter fathers)))
                    (require (distinct? (map father-yacht fathers)))
                    (for-each (lambda (father) (require (distinct? (list (father-daughter father)
                                                                    (father-yacht father)))))
                      fathers)
                    (require (eq? (father-daughter parker)
                                  (father-yacht (father-of 'gabrielle fathers))))
                    fathers)))))))
     env)
    (test "There are two solutions if we're not told about Moore."
          2
          (length (ambeval* '(yachts-no-moore) env)))))
