(load "test.scm")
(load "install-packages.scm")
(load "ambeval-global.scm")
(load "ambeval-global-until-fail.scm")
(load "require.scm")
(load "distinct?.scm")
(load "yachts.scm")
(load "yachts-sans-moore.scm")

(install-packages)
(ambeval-global require)
(ambeval-global distinct?)
(ambeval-global yachts)
(ambeval-global yachts-sans-moore)

(define lorna (cadr (assq 'lorna (car (ambeval-global-until-fail '(yachts))))))
(define solutions-sans-moore (length (ambeval-global-until-fail '(yachts-sans-moore))))

(test
 "lorna's father"
 'downing
 lorna
 'eq? eq?)

(test
 "solutions with indeterminate mary-ann"
 6
 solutions-sans-moore
 '= =)
