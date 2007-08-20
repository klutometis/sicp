(define (assemble controller-text machine)
  (extract-labels controller-text
    (lambda (insts labels)
      ((machine 'set-entry-points!) (map car labels))
      (update-insts! insts labels machine)
      insts)))
