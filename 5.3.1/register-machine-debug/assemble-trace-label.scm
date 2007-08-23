(define (assemble controller-text machine)
  (extract-labels controller-text
    (lambda (insts labels)
      (update-insts! insts labels machine)
      (if (default-object? (machine 'get-label))
          ((machine 'set-label!) (car (car labels))))
      insts)))
