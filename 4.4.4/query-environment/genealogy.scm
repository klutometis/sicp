;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define genealogy
  '((assert! (son Adam Cain))
    (assert! (son Cain Enoch))
    (assert! (son Enoch Irad))
    (assert! (son Irad Mehujael))
    (assert! (son Mehujael Methushael))
    (assert! (son Methushael Lamech))
    (assert! (wife Lamech Ada))
    (assert! (son Ada Jabal))
    (assert! (son Ada Jubal))
    (assert! (rule ((grandson) ?grossvater ?enkel)
                   (and (son ?grossvater ?sohn)
                        (son ?sohn ?enkel))))
    (assert! (rule (son ?mann ?sohn)
                   (and (wife ?mann ?weib)
                        (son ?weib ?sohn))))
    (assert! (rule ((great . ?rel) ?urvater ?ursohn)
                   (and (son ?urvater ?sohn)
                        (?rel ?sohn ?ursohn))))
    ))
                   
