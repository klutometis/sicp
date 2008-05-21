;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension
 syntax-case
 check)
(require '../2.1.2/section)
(import* section-2.1.2
         make-rectangle-edges
         make-segment
         make-point
         length-rectangle-edges
         width-rectangle-edges
         perimeter-rectangle
         area-rectangle
         make-rectangle-diagonal
         length-rectangle-diagonal
         width-rectangle-diagonal)

(let ((perimeter 18.0)
      (area 20.0))
  (let ((rectangle (make-rectangle-edges
                    (make-segment (make-point 0 0) (make-point 0 5))
                    (make-segment (make-point 0 5) (make-point 4 5)))))
    (let ((length (length-rectangle-edges rectangle))
          (width (width-rectangle-edges rectangle)))
      (check (perimeter-rectangle length width) => perimeter)
      (check (area-rectangle length width) => area)))

  (let ((rectangle (make-rectangle-diagonal
                    (make-point 0 0)
                    (make-point 4 5))))
    (let ((length (length-rectangle-diagonal rectangle))
          (width (width-rectangle-diagonal rectangle)))
      (check (perimeter-rectangle length width) => perimeter)
      (check (area-rectangle length width) => area))))
