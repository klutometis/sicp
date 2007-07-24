(load "first-agenda-item.scm")
;;(load "the-agenda.scm")
(load "remove-first-agenda-item!.scm")
(load "empty-agenda?.scm")

(define (propagate)
  (if (empty-agenda? the-agenda)
      'done
      (let ((first-item (first-agenda-item the-agenda)))
        (first-item)
        (remove-first-agenda-item! the-agenda)
        (propagate))))
