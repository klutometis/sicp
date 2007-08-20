;; Has to access the objects themselves?
(define-syntax add-if-not-member!
  (syntax-rules ()
    ((_ object objects)
     (if (member object objects)
         false
         (let ((object (list object)))
           (if (null? objects)
               (set! objects object)
               (append! objects object)))))))
