(define (indexable? pat)
  (or (constant-symbol? (car pat))
      (var? (car pat))))
