(load "assoc.scm")

(define (make-table same-key?)
  (let ((local-table (list '*table*)))
    (define (lookup keys)
      (define (lookup-iter keys table)
        (if (pair? keys)
            (let* ((key (car keys))
                   (subtable (assoc key (cdr table) same-key?)))
              (if subtable
                  (if (list? subtable)
                      (lookup-iter (cdr keys) subtable)
                      (if (null? (cdr keys))
                          (cdr subtable)
                          ;; Looking for a subtable, found a terminal
                          ;; record instead.
                          #f))
                  #f))
            ;; We've found a record
            (let ((record table))
              (cdr record))))
      (lookup-iter keys local-table))

    (define (insert! keys value)
      (define (insert!-iter keys table)
        (if (pair? keys)
            (let* ((key (car keys))
                   (subtable (assoc key (cdr table) same-key?)))
              (if subtable
                  (if (list? subtable)
                      ;; Encountered a table, and will add a subtable.
                      (insert!-iter (cdr keys) subtable)
                      ;; Encountered a record.
                      (if (null? (cdr keys))
                          ;; Mutate the record with a new value.
                          (set-cdr! subtable value)
                          ;; Convert the record into a subtable.
                          (begin
                            (set-cdr! subtable '())
                            (insert!-iter (cdr keys) subtable))))
                  (if (null? (cdr keys))
                      ;; New record
                      (set-cdr! table (cons (cons key value) (cdr table)))
                      ;; New table
                      (begin
                        (set-cdr! table (cons (list key) (cdr table)))
                        (insert!-iter (cdr keys)
                                      (assoc key (cdr table) same-key?))))))))
      (insert!-iter keys local-table)
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))
