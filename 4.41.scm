#!/usr/bin/env chicken-scheme

(use bindings combinatorics test)

(define (ordinary-multiple-dwelling)
  (call/cc
   (lambda (return)
     (ordered-subset-for-each
      (bind-lambda (baker cooper fletcher miller smith)
              (when (and (not (= baker 5))
                         (not (= cooper 1))
                         (not (= fletcher 5))
                         (not (= fletcher 1))
                         (> miller cooper)
                         (not (= (abs (- smith fletcher)) 1))
                         (not (= (abs (- fletcher cooper)) 1)))
                (return `((baker ,baker)
                          (cooper ,cooper)
                          (fletcher ,fletcher)
                          (miller ,miller)
                          (smith ,smith)))))
      '(1 2 3 4 5)))))

(test "Multiple dwelling in ordinary Scheme"
      '((baker 3) (cooper 2) (fletcher 4) (miller 5) (smith 1))
      (ordinary-multiple-dwelling))
