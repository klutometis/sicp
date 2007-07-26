(load-option 'format)

(load "make-serializer.scm")

(define format-serialized
  (let ((serialized (make-serializer)))
      (serialized format)))
