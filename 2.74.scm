#!/usr/bin/env chicken-scheme
(use alist-lib extras medea sicp srfi-61 test)

(define (install-division-a-package)
  (define get-person (cut alist-ref <> 'person))
  (define get-salary (cut alist-ref <> 'salary))
  (define (read-record file)
    (attach-tag 'division-a-record (read file)))
  (put 'get-person '(division-a-record) get-person)
  (put 'get-salary '(division-a-record) get-salary)
  (put 'read-record '(division-a-file) read-record)
  (put 'eof? '(division-a-record) eof-object?)
  (put 'close '(division-a-file) close-input-port))

(define (install-division-b-package)
  (define (get-person record)
    (string->symbol (alist-ref record 'name)))
  (define get-salary (cute alist-ref <> 'income))
  (define (read-record file)
    (attach-tag 'division-b-record
                (let ((object (read-line file)))
                  (if (eof-object? object)
                      object
                      (read-json object)))))
  (put 'get-person '(division-b-record) get-person)
  (put 'get-salary '(division-b-record) get-salary)
  (put 'read-record '(division-b-file) read-record)
  (put 'eof? '(division-b-record) eof-object?)
  (put 'close '(division-b-file) close-input-port))

(define (file-tag file)
  (string->symbol (read-line file)))

(define (make-file file)
  (let ((file (open-input-file file)))
    (attach-tag (file-tag file) file)))

(define (read-record file)
  (apply-generic 'read-record file))

(define (get-person record)
  (apply-generic 'get-person record))

(define (eof? record)
  (apply-generic 'eof? record))

(define (close file)
  (apply-generic 'close file))

(define (get-record person file)
  (dynamic-wind
      void
      (lambda () (let iter ((record (read-record file)))
              (if (eof? record)
                  #f
                  (if (eq? person (get-person record))
                      record
                      (iter (read-record file))))))
      (lambda () (close file))))

(define (make-person name)
  (attach-tag 'person name))

(define (get-salary record)
  (apply-generic 'get-salary record))

(define (get-salary record)
  (apply-generic 'get-salary record))

(define (find-employee-record person files)
  (append-map (lambda (file)
                (let ((record (get-record person (make-file file))))
                  (if record
                      (list record)
                      '())))
              files))

(install-division-a-package)
(install-division-b-package)

(let ((jake (get-record 'jake (make-file "division-a-1.data")))
      (mary (get-record 'mary (make-file "division-b-1.data"))))
  (test "(get-record 'jake (make-file \"division-a-1.data\"))"
        jake
        '(division-a-record (person . jake) (salary . 110000)))
  (test "(get-record 'mary (make-file \"division-b-1.data\"))"
        mary
        '(division-b-record (name . "mary") (income . 110000)))
  (test 110000 (get-salary jake))
  (test 110000 (get-salary mary)))

(test '((division-b-record (name . "barbara") (income . 60000)))
      (find-employee-record 'barbara '("division-b-1.data"
                                       "division-b-2.data")))
