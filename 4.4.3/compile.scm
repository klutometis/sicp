(let ((table (make-equal-hash-table)))
  (hash-table/put! table '(nigs) '(nogs))
  (hash-table/put! table '(rigs) '(sogs))
  (hash-table/put! table '(nigs) '(noogs))
  (hash-table->alist table))

(define alist (((? middle-manager) aull dewitt) ((? middle-manager) warbucks oliver) ((? x) aull dewitt)))
