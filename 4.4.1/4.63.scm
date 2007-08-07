(load "context.scm")

(initialize-data-base '())

(define genealogy
  '((son Adam Cain)
    (son Cain Enoch)
    (son Enoch Irad)
    (son Irad Mehujael)
    (son Mehujaol Methushael)
    (son Methushael Lamech)
    (wife Lamech Ada)
    (son Ada Jabal)
    (son Ada Jubal)
    (rule (grandson ?s ?g)
          (and (son ?s ?f)
               (son ?f ?g)))
    (rule (son ?m ?s)
          (and (wife ?m ?w)
               (son ?w ?s)))))

(map (lambda (assertion) (query `(assert! ,assertion)))
     genealogy)

(define grandsons-cain (query '(grandson cain ?s)))
(define sons-lamech (query '(son lamech ?s)))
(define grandsons-methushael (query '(grandson methushael ?s)))

(test
 "grandsons of cain"
 '((grandson cain irad))
 grandsons-cain
 'equal? equal?)

(test
 "sons of lamech"
 '((son lamech jubal) (son lamech jabal))
 sons-lamech
 'equal? equal?)

(test
 "grandsons of methushael"
 '((grandson methushael jubal) (grandson methushael jabal))
 grandsons-methushael
 'equal? equal?)
