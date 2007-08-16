(load "amb-qeval/amb-qeval-contents.scm")
(load "amb-qeval/amb-qeval-get.scm")
(load "amb-qeval/amb-qeval-make-data-base.scm")
(load "amb-qeval/amb-qeval-map.scm")
(load "amb-qeval/amb-qeval-match?.scm")
(load "amb-qeval/amb-qeval-put!.scm")
(load "amb-qeval/amb-qeval.scm")
(load "amb-qeval/amb-qeval-global.scm")
(load "amb-qeval/amb-qeval-global-until-fail.scm")
(load "amb-qeval/amb-qeval-global-n.scm")
(load "amb-qeval/amb-qeval-microshaft.scm")
(load "amb-qeval/amb-qeval-simple-query.scm")
(load "amb-qeval/amb-qeval-tagged-list?.scm")
(load "amb-qeval/amb-qeval-type.scm")
(load "amb-qeval/amb-qeval-var?.scm")

(define amb-qeval-context
  (list amb-qeval-contents
        amb-qeval-get
        amb-qeval-make-data-base
        amb-qeval-map
        amb-qeval-match?
        amb-qeval-put!
        amb-qeval
        amb-qeval-microshaft
        amb-qeval-simple-query
        amb-qeval-tagged-list?
        amb-qeval-type
        amb-qeval-var?))
