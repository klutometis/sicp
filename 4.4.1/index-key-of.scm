(define (index-key-of pat)
  (let ((key (car pat)))
    (if (var? key) '? key)))
