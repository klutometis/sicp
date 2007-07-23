(load "division.scm")
(load "get.scm")

;; Returns false if no record
(define (get-record name file)
  (let* ((port (open-input-file file))
         (this-division (division port)))
    (define (search-records)
      (let ((this-record ((get 'record this-division) port)))
        (if (eof-object? this-record)
            false
            (let ((this-name ((get 'name this-division) this-record)))
              (if (string=? name this-name)
                  (list this-division ((get 'employee-record this-division) this-record))
                  (search-records))))))
        (search-records)))

