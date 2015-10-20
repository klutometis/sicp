#!/usr/bin/env chicken-scheme
(use sicp-eval-logic test)

(with-microshaft-database
 (lambda ()
   (qeval* '(assert! (meeting accounting (Monday 9am))))
   (qeval* '(assert! (meeting administration (Monday 10am))))
   (qeval* '(assert! (meeting computer (Wednesday 3pm))))
   (qeval* '(assert! (meeting administration (Friday 1pm))))
   (qeval* '(assert! (meeting whole-company (Wednesday 4pm))))
   
   (test
    "Friday meetings"
    '((meeting administration (Friday 1pm)))
    (qeval* '(meeting ?division (Friday ?time))))

   (qeval* '(assert! (rule (meeting-time ?person ?day-and-time)
                           (and (job ?person (?division . ?rest-division))
                                (or (meeting ?division ?day-and-time)
                                    (meeting whole-company ?day-and-time))))))

   (test
    "Name-specific meetings"
    '((meeting-time (Hacker Alyssa P) (Wednesday 3pm))
      (meeting-time (Hacker Alyssa P) (Wednesday 4pm)))
    (qeval* '(meeting-time (Hacker Alyssa P) (Wednesday ?time))))))
