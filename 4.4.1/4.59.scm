(load "context.scm")

(initialize-data-base microshaft-data-base)

(define meetings
  '((assert! (meeting accounting (Monday 9am)))
    (assert! (meeting administration (Monday 10am)))
    (assert! (meeting computer (Wednesday 3pm)))
    (assert! (meeting administration (Friday 1pm)))
    (assert! (meeting whole-company (Wednesday 4pm)))))

(map query meetings)

(define friday-meetings (query '(meeting ?div (Friday . ?time))))

(query '(assert! (rule (meeting-time ?person ?day-and-time)
                       (and (job ?person (?division . ?subdivision))
                            (or (meeting ?division ?day-and-time)
                                (meeting whole-company ?day-and-time))))))

(define aph-wednesday
  (query '(meeting-time (Hacker Alyssa P) (Wednesday . ?time))))

(test
 "friday meetings"
 '((meeting administration (friday 1pm)))
 friday-meetings
 'equal? equal?)

(test
 "alyssa on wednesday"
 '((meeting-time (hacker alyssa p) (wednesday 3pm)) (meeting-time (hacker alyssa p) (wednesday 4pm)))
 aph-wednesday
 'equal? equal?)
